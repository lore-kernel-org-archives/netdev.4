Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566177;
	b=rKFNrgZoBCk6XMMcAsYVU8rM076IuiJCpE9UALHDW9xMU1vntQ/3UgoHVytUBw3zQ1x/
	 mbmuCQr2eTXEmEcaA8eKqI0PrA3A6w3USEGk+9Sd/18NySV0tFpHxejRN4hlECyLn1JbL
	 CI+0Ahu4maqUhwsiSBQbH9w70tUX0uD4oXwFL0gpCcgmrA42MJ6hnJbpxxjYAlOoWEPsZ
	 Qc812vroEDSNRgjzV6opoPuoN9iYU1i1oqXBCs2eC+ESo6fTBhGeYLiKMADGvo77lPVBb
	 B+ZQxcDNGfWUnRjbPZIdVIY96WSRo59WmZlO5lZXS1fM5dmYzOLue5zgcNSLRGQGhbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c7sK3HiswYiBR3BUWinqF/pjgDocEFdhpnqkaPcX0Mw=;
	b=0XW8JnvgzVZAXuJGhq4lg1bQYImYKGpi2LUGVAKIdhdcomH/Jfhv9O392F0NHDUcObKv
	 BG3yfO54RqSeh1pZCsj8SZt5Ac1KhOSCttJQ9Ypz0J2EuTKRCvZQ/yKRp0aPm2QtEW5Jf
	 PL1eMEusEGTiPRQfhWXFefpe0dsNw/NwPnCt6kmxJysIYctG/eqWvbzAtlih04krX7fTt
	 EERejEBobyyTPj8FGIBybw2Pb/2LMoxlLF6f0eeOAd0ftXJrZF47Tc84cnSnpJaDASYpF
	 vSSUP+sEmHeHgCOAzaF3PEMXAXtF/PooaCpxRW4araWKWVT3b50NLnTi80m8TlA8Jzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=Sy0vYPk1;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40881606A333
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40881606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=Sy0vYPk1
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so44566305e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795566175; x=1796170975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7sK3HiswYiBR3BUWinqF/pjgDocEFdhpnqkaPcX0Mw=;
        b=Sy0vYPk1cozpkelPBK5zopcg/tq/bbrII5RY5Ay9pe2Zpk7LWGfOfnDYRUnczkIhKy
         fPvbYbJoJpReRWPrgHlK1zVpJRyNYzGYCsYoCj8OExCZIiX0cGWmyDggZVw0fVe8Fq3/
         nJCDjltN3+CFgsTkasypBw+a8+bVCYCyBs6V3xpUk9BGyDIBLoM3HgJD5gN5W/f7aqqo
         pjkRj3+trg8E0sHWwEthvpagwagPkTp/w/4X5A6U1fgltC9RpRolndNy9F9axqbOU4Aj
         8P0kPii5pupVxKN+H7AbjVrJZDUX7D26KYzakQzAlo7GeGrAnqI4XzB2EGCYzlqAM6D4
         AEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566175; x=1796170975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7sK3HiswYiBR3BUWinqF/pjgDocEFdhpnqkaPcX0Mw=;
        b=ZbTRvk4LZwEkyiMVk14HY0MqcExpsKDSG/jLLTXjg6HXxCJFOoTBtaT/wajXIonPnB
         d7CRM+s1ABUbk8f4fqYWtzPzHlqb0aKgg+4RHt8GSPtOXdOQ7x1UY19jzZxmk4XtLDGJ
         1/Mxo8FdaLIZyHd70eitNnDCKiNOxRZCUvvwkQNBvJwp76TcYYS6ygHKVQayYsGotwzo
         MhdCboOhRiGGIvShrTHYarMRW0IIMn0zbz5KjALjfeIp3vjDexOPfwN9ldVnVbMrognj
         5mTsizF9421vX04//lJM4/KmgnXXCOk5aJrMbAM1NcHkf8ZYJhjzxlUzC04RguhD0+VK
         vOwQ==
X-Gm-Message-State: APuU4Z8NoiuYAnAJdlATi9Sijul85+YFbU4J03LH9VDVDsOLgDl8wC5s
	1yczlvsbSogGB6cvzcKmDx5wrsFHU4qQ0z6RF4vgaRScEsSGDWrbPyKLuJ2wIevjDYFtdIs8Geh
	hyKtu2zj1CqRCziu+pbyTPG5x4BVJ0lLOqgtex2bK6rJVktoxGQGGtzSi2gMQMkuDBYE=
X-Gm-Gg: AZFdTZd2cW4ThSWVQmCKyF5gUrciCyk4JfXvyiSQECwGMjUnBXzaCVAx5Lrv9h952R1
	xGrgjCWgetapHkAbq42PRVkGXHd318TAgMTsVp8TmXXTjyG0sIQxB60OhZ+56woBTWcOmXOaRGr
	J6WB3Vj2NP0msJLcCow3ffCQYdh2H00MpHZX7cK+zDKLxfYhTD9HiVu6lbSzblB3UHfDGFShdkZ
	JsP9Cse8kRSkh50xX4kpAfdyf9NgoD2ah591HIrD0CvcSUbopGlysWb9wS/9Tnr25EpcSJaRaB6
	gETI1J2VL+3BBs+wi3L6m/bNeq2EYMYMX5DPps5viqDCPFSl1+l/dfEmDx1BnOhZAH7o5maZMpm
	lIzE9bF4PNJkDdvP7muzDhrfCqx3vCgNOGK/TLt0lH8/wn/KNa/6eWbn+m5xT+1GVegdH43tpJ8
	RlsQPy98xZ9RfclZbWIZMMYpOlR90i7WOzbwwL+X8uZKjaGR8yE+Weq5vqz7lfeqNQ56rMYsln/
	OrVfWAupVe/6epJ2thdeHH3O+biTo7BiocwfyLYdW4uOUPCM5fG7v4PiQtJs6iS5PE8QxlCB9ru
	4b48kBSJX8Bydc+11WZUNXOXPwcNe35w6TUB/C2St/9+CY0uMH+p
X-Received: by 2002:a05:600c:64c6:b0:4bb:6fd3:5aaa with SMTP id 5b1f17b1804b1-4bb887c30fbmr290488115e9.3.1795566175644;
        Tue, 24 Nov 2026 16:22:55 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5c82:5cd3:7bc5:2809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31518448f8f.16.2026.11.24.16.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:22:55 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Antonio Quartulli <antonio@openvpn.net>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Ralf Lici <ralf@mandelbit.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	stable@vger.kernel.org
Subject: [PATCH net 7/7] selftests: ovpn: avoid calling freeaddrinfo() on NULL
Date: Wed, 25 Nov 2026 01:22:38 +0100
Message-ID: <20261125002239.1191542-8-antonio@openvpn.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125002239.1191542-1-antonio@openvpn.net>
References: <20261125002239.1191542-1-antonio@openvpn.net>
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

ovpn_parse_remote() always calls freeaddrinfo() on its exit path, but
result is NULL when no vpnip was passed (with or without a remote host).

POSIX does not allow passing NULL to freeaddrinfo(). glibc tolerates
it, while musl dereferences the pointer and ovpn-cli segfaults.

Only free result when getaddrinfo() actually returned a list.

Fixes: 0bd9cfebc1c9 ("selftests/net: ovpn: fix getaddrinfo memory leak in ovpn_parse_remote()")
Cc: stable@vger.kernel.org
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 tools/testing/selftests/net/ovpn/ovpn-cli.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index 00b80bc5157f..a6f0f6be43a7 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -1888,7 +1888,8 @@ static int ovpn_parse_remote(struct ovpn_ctx *ovpn, const char *host,
 
 	ret = 0;
 out:
-	freeaddrinfo(result);
+	if (result)
+		freeaddrinfo(result);
 	return ret;
 }
 
