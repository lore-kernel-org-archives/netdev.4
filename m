Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222097;
	b=HeuvKKnNTRiDpUk3Xh8s2C/Ppy9bYH1AAqfcsBG8UGSC0htzQLGAUwTUupAb09g0rnt1
	 BcX+u+96kVEUMFCrpUnPric9q9CwVDlK1sm/PqWyFo5gPKV1TQ6Hglv2/Vp+4a6ab5ozo
	 OPareOYGuHfVxT85Q/0aMnfTGmv/k0ot5+HYKYxBUmH13IATwTMmf+UsntKFKF1xZ2jWF
	 vuRJEz8cILPOgE1xRJKyP4cvgdINi6/fXkX8P4sGUGTMLxqqFL+LdABHYAA+7jqeg27gC
	 H8QUnvsimKW5kTRD+xkpt1P6JDR7geknKkxhq7gTgGLvv+aOqNVAqEeYp9g0OikxD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
	b=xJ49jTyZAO8Rd1D98aaQmuM9JnQ1MQZhZGG4nbI8nouWuQQ/xJJJUfxR1XIdtIC/a5d/
	 Di11k3J1gdLHlDR694jR3l7AtHkf7/byJGrbw0UH4sf3LIqrxc3rDlRrBzBKyKrZOBW+k
	 EXjywLm2WJjLQn2caI3b3ay0/q8xjEcut9sDkmDPpjYVTxOPV1pDvYZvUk8XotjLCurUM
	 Apkix7GVk4RHKhkPZjyErLEJU4ymO5mgT0E1LxGtak742vWA/XEvvmN12132ZsgzU08Sd
	 2tZ0h9C3JgP8rAFjH+x59l3xx9Xo1vfYjm/jZDu+HsHSXA48o+8oUcIkFDIrpKtwGxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5paIkky;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33E606A69C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E33E606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5paIkky
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so3262053c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222094; x=1795826894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=j5paIkkyGMRCwCSCH4OMqfQvxzsz+SywGoAE5feK9lOz4XS4Eqw1cD3uTlmZfBKjjO
         exCM0RAmo0lrulEzkZU5k5cw4ilRr9p3f7+NGXbi1aukxxRwXjt32HAyoE52W3RCY+tY
         Wvskq9pptmEjNfxP39rxtQNlg9UPRpNk1PHEo5igWrn1FQrus9fS8XyjTVpAZ1UmrmYX
         fXWxMgmbqhY2MLnMvAGMb/kiKFK8ubD7ZqVLnWacsde+Awu7SAXVqzY3cGRyjMHXMQNF
         zhL4LMYf5VAKXxJ2oLRosJLfI6k6RX+459QloyqO2M9rO+nS1K6lHZWS9TD1TXfrEKRN
         LOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222094; x=1795826894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=wF2jMnfmUEmPDMgiBF9JrmgEaqnzpoVWQm5nE2DNb8cdfHPaJGqxNXb3vCmQv7yDvI
         GJamStKMxMDwtVjpD6OuP4vqP0eHo2c4T4Yfsvx92pQMQB0KIUYAefeZL2RT3CL+g7KS
         kBUoKuGym6SqhIErUpSzX3GfVSCwQx8R7g9/iGAutC1AHRYYfukt1gixdUxjlFLH9X1H
         UhzSFQt7P05P7GV0n16EzXCPW8Td5yR8YrMxU22C3uZaSHO5BAOOETIvFuMURf/EdIzu
         jBmK51e36WKAtY4kWl80hhyzdXp/EaKUL5bzfaanU/HohYQnBeTJ0jkMzdBAbgnO5uGn
         6tnw==
X-Gm-Message-State: APuU4Z/3QAwRcy7PKUbRW2A7YEZNBTb+9DDZ5czpU0NrLLQi05QHaOTo
	o+k0O0KxgHR4G45Q+43fvX2afTAbwPCqPU2dOvOCg/C0E7jPmTO4lP4QQOcJaA==
X-Gm-Gg: AYBFou0QamdXyFE8RG3U6djtJxV4Fr5tAwvpsxcN8Jb6pkrihc2pHDukWSsYAzluIxc
	bhGED5qd6rU59hs2yK8dp/ax8z4jw5aSlEuICPFRWGZGCqp0+17w9sSugTNI0uW/mtlVAPnefyC
	tf4YgbkAUoC7My9hg7sJmny+254v0jXRejR97ZYSMYXH+nxNdDkRLb/AXldx7wM3mXM6zt1TI5B
	TP4itPONiD9j+vlSzfJQLXGa0BneBk70gzP88mfjtf9GawgzbRnIZgCh8EgadSYTEKFsE4nUemq
	EUYyMQuj2rMTDvKi66bPTtaDRtJ+EWs7yaNmOnqYlbG39+UkSSrcujCEj/qC/o4cr+iedcLsQ9N
	tdTcJxzxcr/uAMDDE44WSB6/t3DrH9liZhLDCZbeHmMnAS8fm8XaD2K9JzCW7/SbOF0t6lRI8FW
	gB8OTEqUixMiT3B9IQ9m1RUdQfcCJFFgIjT+gMRgFZquO/P4Ua89eJZc4j4t/z5/h7HPNwi1P18
	ePGWiIEABQH/5E6pHjOF0uH2RFNffnHS6OwOzcDgkzqqs28P/HXk87MoMWPP8yGTCsh63lRRzPp
	XJkNRli281zVLOHyG80iKwddmo2S6J0=
X-Received: by 2002:a05:701b:2313:b0:151:d6e5:596b with SMTP id a92af1059eb24-1b5568b31admr4284679c88.9.1795222094302;
        Fri, 20 Nov 2026 16:48:14 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:13 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 02/10] net: au1000: clear all-multicast mode when restoring hash filtering
Date: Fri, 20 Nov 2026 16:48:01 -0800
Message-ID: <20261121004809.1690280-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAC_PASS_ALL_MULTI remains set after IFF_ALLMULTI is cleared or the
multicast list shrinks below the filter limit. Clear it when programming
the selective multicast hash so unwanted multicast traffic is filtered
again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index cd25248f4e3a..58bc8e1b539d 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1042,7 +1042,7 @@ static void au1000_multicast_list(struct net_device *dev)
 					(long *)mc_filter);
 		writel(mc_filter[1], &aup->mac->multi_hash_high);
 		writel(mc_filter[0], &aup->mac->multi_hash_low);
-		reg &= ~MAC_PROMISCUOUS;
+		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
 	writel(reg, &aup->mac->control);
-- 
2.53.0

