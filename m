Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943951;
	b=x03DH+6MuZLoT2KfJDuQBJg0NziAG5qMzkUfKlD1mKLLJYpupTugJpMOXV9aweivIjrd
	 ygRMlfwmCtGwIOY6V4Tuex6oWXLn/Q18eJBc3Oxwfn/Hor7yQAPFMKScQ8VAoiimuOFv8
	 M1tkgRKoA9IxNskwTnUohr/txcNeGjWXzw1eFhXg/n1TNqc0NcKFhA86mcCehpopA2nIm
	 6wglE2xBgtmM2r+w7qZSiL4l7pOEpDql+x9Au3iILXoBaiOLlfvWBQSDP/dkwyf0u1l81
	 kaKFv2lj3WUTsFfxtJK8x8lCGXFTeTQi8/5Z7tiubEisxxtiWRdpEbDzpVJJK7oniQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
	b=oqzpMhe8656QNjdr3C56qfQfVutYaOpRVp0vHrENmZcJ1s8k7OaXH8JWIZcP8CvGqZBz
	 767/mNs4yw92hX8zBKrJqfVd1IP/iPjvzq5swltQG09zsQ2IIqGf9e178bMv8wTZx1pvq
	 YjFZfES4NtVhC3giqQ6wfObkTJvaxqNH+4acL/uFnqu69Xa6l/WMHpuZDEuECmo86vPmt
	 uYLLw2yMvjN2BYvtvo51fvpeF0UKYhBkC8PxYZHcQxgND2BR63WybOgdq91ywWaZuc3eL
	 W7tDUtUoiUaVYEc3t3PyMqHwyxXb8CATSznBRFHk8dMwZq5hHQrLJYInJ4AGnQN4o9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsy+YBE;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F283606A330
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F283606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsy+YBE
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40319bdso433663eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943950; x=1795548750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=wgsy+YBERwE8HaMtCH3zQhnnpciwtzZQP80JZzZBJmv4J5oZOK2jGXvtwO8otIBVu7
         48Ht2WBjJy+TE+NPdtHH8/kI8rcXsp1iKMjxdqeRHebP3uiq2VG8QZ2yvs8u/moOA2X0
         eQO1AIh21ELdvzeca8Ld0lJB27M2qQYJb527ZgkSkUYRtRCgw6O847EpKhHyvlkmmHeS
         hQePV0RNVl+dH7YG1CA9qxQo6LTNYZfajEqXkxxooWzXz+pPXs1zkhVHILC/M1q9ZEwa
         R0891SpFrMdpYOe2pKuLbYSRRbS5VnYddB0FS0LX/xYkyFcgDoaQHvv7yZS+MHgyWKhG
         w18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943950; x=1795548750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=NxnHPmZIidvp31JDGVVWNgtLK3cZSODhrWEJaWrnj6egOYxfLod1VMX1U8Z7sMhuqN
         4cawXo4m4hHJczfArjs4pKIqByppdMUZv1ZOGteHRxxm8jmHWKFUa9VB+5et/O44saKO
         wMrHt7NHGPvkaY4CWJeU5FTSXdWL6TRWLrjtzHP3ofBjmwH6rwEo5r3YASfzk+4b/zXg
         fKz0C6ZqeK8SaIFx0Lildju6TcX6nfWNaOtPcNrYZ7R3O/JO24O9zVA86E1JOYwg0j2k
         /GDrj/1c5lV1M9Oov1ZswyvyGOVJpJ5NKfbLoerq6RMlmro07fixsbV1syFy7Bl8orvh
         eaMg==
X-Gm-Message-State: APuU4Z+2gy/JvP757a+aeIFdmO6AWmYL1hm9PzQ7dSnrFgAX3KogmUJO
	WGTORIcrd6RZHjJMn1gfGa/SjdLXJM/02noRRlVqpkxAv8mI96iQFdsynp1Jqg==
X-Gm-Gg: AZFdTZf3ccX2Oi9/e5vTFDYyX/8JI2OQC7CQBjaUF4vzINdYgLaF/Z82SJStnRcF0B5
	q8+k6jyRo2ZOvTTivGUpO5SHCb/dQ0DY4vV6Yr8OQSvmAQDgUw/O0VgH0vrMNq85pKemRGDWNSz
	RMmuRNiU1XE3/fINobUQK+oC7KaL5HppYTeaEnf0KZ2RlZYhBA5R6fi56XLSsM0QwYguF8WRNwI
	KRaf26hpPFeA2D9NlTp6NcJvU2NA7RJaXiT1B+X+3SjAUXDcxjCXzsxbqREZPOT16VcfeJb6OdD
	SYyJ323dkCiAglJaXKhBqjuyk/UEonjWadYFQ1EjK1O/WT0vWheSF1RAK4KNHelsFdkSKJjgXA5
	xRhyAEHZ1tyQOZ3K4cb1jBb6K14FvgdA2HgKcEqMEsRwVrbwFW5v/iW/7cWEW6OFNNDotvSrOtr
	oT3g1czdQlh9FAZ1FdOJroL7JiUBZObPEp82Xi9kW+pn7hw8IuuwbC49P5sx8EiJSJw/0QiqvbH
	yAHeQAi0N+ZvCEY/9Q5hXGpwCp5JAXTA2CPgrUHQPw5DNChNet5A0AsR9sQUP7luwQP5lWvxl4N
	V9HFkcV5
X-Received: by 2002:a05:7300:2387:b0:381:2114:99d0 with SMTP id 5a478bee46e88-3828181007amr456120eec.39.1794943950264;
        Tue, 17 Nov 2026 11:32:30 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:29 -0800 (PST)
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
Subject: [PATCH net v3 02/10] net: au1000: clear all-multicast mode when restoring hash filtering
Date: Tue, 17 Nov 2026 11:32:15 -0800
Message-ID: <20261117193223.2795612-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

