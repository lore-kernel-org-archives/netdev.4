Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539962;
	b=gHL6eNaCgFZovMoMMsW5n7kCD4BShVamKYuU3aIaWc1sWSldvZ2Ia2VXMv+LeA1jFahV
	 yPwyDNQZ40ZcUBZRvLhCFPkwHTH63HZzgZALYTTZrUP15c1A1GeP6eSjOzg2JvIP1rzEJ
	 7tgFHfnOgtnYRxCoxrwWcZAbAg3CqPo0Js/k6g+XXAnNyHTez3n5sfcvGren2L8y/gLBu
	 lk9Y+DaqrTs25+/Y2iQ0yC2pTYTf+8irK9dT5OCbjMNGG1b7B4xbj74s05Ur2cJh/V00G
	 nD4zfui1RTShtmGk0mqWSNvGWkomth8efhvX18OxrQmLI8RfhfjEHGz32I4j0lASOmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GycbPrjLIEZ3KgMVDJILZlmIak4gkeiTtWgG7biYRic=;
	b=INjtWKl4u1Y0sUwdGyvdim4mIw88S4+hwOhueYvGZ4v9pGN4AyHU5KiZOWu38DzDhviY
	 gQcEDeCcr4rVMMnql9T9pWUxSs40rJm84ttwDr+8V8skvzVXauwGzZnTIUkipAdtknsyV
	 OYPcNFMCHcatGeMziaNRtvYWTBzsw1CEw28gzMRcQADYUfjytjjZGLMbtBkw6dmghkdiM
	 tKNb1XPJ9YcRWuEhFD5GNfnSDWJgjDtVHjET8zt1L2PkPOXE5ZA+gmwFpDQoPgG0Y4BmC
	 s/bP2dgjqB3/lCpGw6Wrf5vuwdA82UBm5qhdCLdNA/5xMGwi3QZvTu6bOUhcEoLXS0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JVBZ/gci";
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F62606A68D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F62606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVBZ/gci
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67dc7eb1442so5253391d50.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539961; x=1796144761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GycbPrjLIEZ3KgMVDJILZlmIak4gkeiTtWgG7biYRic=;
        b=JVBZ/gciU8LaadUKVtSxe50zsEVtAqSBrFa6R0oOPjGU32k79tm4PAgfTYushX8mZ4
         jDUIJ94c9byvlcuPpO4pToPmifFXcCN9X1we8w7xV/mU5cEJrX5Tx3mk0fjUY+Sc9Any
         9PP5YrZx4cKIiIgnDiHNImHjHolwwI/N8HAf20MZ4+aNaRggPQCrfCcvN0fsB6mKqDXS
         nu1fA9NrE3k+t45Rqn13vH0Y1nAC8NJqot5XOs2GAafvpEegFOWjeyj2qQnNEOTKm/6Y
         7kY6Yrft2zGdUp0Ad07Yo2RP3Zr+MMLfWHN3FJ9DgJnW/YGuOljwY7EFyYAUHVOu6acQ
         Du0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539961; x=1796144761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GycbPrjLIEZ3KgMVDJILZlmIak4gkeiTtWgG7biYRic=;
        b=EHDJpI/2sJjUPSnSJf1IKkD5MUVJXRxdGX3FH5cTHZ1s9ilxfzICSv/78u5/M3zvxJ
         WXdwWHHUEWDdCdTH857d3JgHD0LVKm/NEoIy8+KaAQx3x7aOW7wa48s2EgA/CoTAD6s3
         R/zh0EysbbqKcfQfXPTaxXSqeC4wmq4uSKKkluuEHFOT6OzQY9mVj49xVGAYWkbGD4+1
         q1sJ7E+WsHeBKLXxcW5WJfY84Rh3Gptn1LwKxGf/He5n9qzRJtbhpjOaRsWDnryspAHA
         2clEFdUWova06hY6eYiTNw9I4pHxa6VMhEtfVONUzwe2j41e8IlFzzMGUpXBxUnPPAuL
         KHyw==
X-Gm-Message-State: APuU4Z+yEUME54IeaC+j6DzPCI+07+SGv2f8mDP5Jaf/oqSuehHe3iXx
	CZP2Wh4pg4x2swt5l7ZQV8ashBvTAbg5xAmUjfGkqqlcsZ+izDMlUAYd9Pcegg==
X-Gm-Gg: AZFdTZeA7G090+TNbCsoGjwi8Tf2QNvD2Mmef+ri17Pl3AapTZH+j1oq42V6hM8s87n
	aPknJ5N2FSDnsaIp6EA/oKILXrGjZOVfjo/vNLWvEbvxUuCPUsy1kXkRCg99TA4vxPvbyqJ8I/D
	Rt8wqIxBzbTO3zhu43J9XsywcFUvUa1oK2s/7QJ3Lu9AVB8e1SUUPS0ZywwS02rHDLRf3t43qyN
	zZdBLAMBaXX/I9ip/zHielQkbjcFpfdVvst5zRK9bCtLG/qpVie89tGPI8ZTan3adVuazLLF746
	TKkC6s4Pgv3VT8/uZ3KvGuysNtaE4B6lZ+eZTNiWvcMfWhA0X1YP6aKDnwH/223Y4XXnqlgW/ct
	77lkJmXKpfdPwcknQygf5ZkWPkBelc2AwBZC2Bl6GOB/ZErRJncIygoANmZIzhlpBsTc68aH2TO
	WRjvKfH7CpL3fHWuwgzj94mxfl24c91/46sGbBF/3s5377FCrCJm5aoUEcWWmgKw+pqIIF5/nT9
	L/cz8WhmJgIyKjljZRS2kHgAPtHdyrsfbZQJ57S4Aegyv5YG6ZouGd5RyITt5EtbXG0cZub4v1n
	RlFMhqYy4c1Mgw6aF3MktP1ScgE/Fd2LgxYtdw8DofP8JXqDbQHCclhqUtTHF4HJz6btYfhBqMp
	25IWR/FXoxGNglKpuxsSzFx4KTaLkGF4g2rwM4jRTE/ApeADE1INANxAFxrXVsMUBgZ1u6jiCtN
	6FpC12keJ2NSiYz7OkJPDzcbV8D6XJ8Sw=
X-Received: by 2002:a05:690e:118b:b0:67d:ba05:de0a with SMTP id 956f58d0204a3-67df44c6725mr7098218d50.109.1795539960862;
        Tue, 24 Nov 2026 09:06:00 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm140078216d6.17.2026.11.24.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:06:00 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	elder@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next 6/6] net: remove unused net_device::min_header_len
Date: Tue, 24 Nov 2026 12:05:44 -0500
Message-ID: <20261124170551.1874487-7-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
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

From: Willem de Bruijn <willemb@google.com>

dev->min_header_len was introduced in commit 217e6fa24ce2 ("net:
introduce device min_header_len") for dev_validate_header() when
header_ops->validate and the CAP_SYS_RAWIO bypass could accept frames
shorter than hard_header_len.

Now that dev_validate_header() and the remaining workarounds in
af_packet have been removed, dev->min_header_len has no readers left.
Remove the field from struct net_device along with its remaining
assignments in ether_setup() and loopback setup.

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 Documentation/networking/net_cachelines/net_device.rst | 1 -
 drivers/net/loopback.c                                 | 1 -
 include/linux/netdevice.h                              | 2 --
 net/ethernet/eth.c                                     | 1 -
 4 files changed, 5 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 7620d3fcb8dc..f73ea0069432 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -46,7 +46,6 @@ netdev_features_t                   gso_partial_features        read_mostly
 unsigned_int                        min_mtu
 unsigned_int                        max_mtu
 unsigned_short                      type
-unsigned_char                       min_header_len
 unsigned_char                       name_assign_type
 int                                 group
 struct net_device_stats             stats
diff --git a/drivers/net/loopback.c b/drivers/net/loopback.c
index 1e6d1b7d71ba..6fdf00c223b9 100644
--- a/drivers/net/loopback.c
+++ b/drivers/net/loopback.c
@@ -173,7 +173,6 @@ static void gen_lo_setup(struct net_device *dev,
 {
 	dev->mtu		= mtu;
 	dev->hard_header_len	= ETH_HLEN;	/* 14	*/
-	dev->min_header_len	= ETH_HLEN;	/* 14	*/
 	dev->addr_len		= ETH_ALEN;	/* 6	*/
 	dev->type		= ARPHRD_LOOPBACK;	/* 0x0001*/
 	dev->flags		= IFF_LOOPBACK;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 930899a7a577..2a1b3f48bed5 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1929,7 +1929,6 @@ enum netdev_reg_state {
  *	@max_mtu:	Interface Maximum MTU value
  *	@type:		Interface hardware type
  *	@hard_header_len: Maximum hardware header length.
- *	@min_header_len:  Minimum hardware header length
  *
  *	@needed_headroom: Extra headroom the hardware may need, but not in all
  *			  cases can this be guaranteed
@@ -2292,7 +2291,6 @@ struct net_device {
 	unsigned int		min_mtu;
 	unsigned int		max_mtu;
 	unsigned short		type;
-	unsigned char		min_header_len;
 	unsigned char		name_assign_type;
 
 	int			group;
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index 39aab0f8035a..db39527d4704 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -330,7 +330,6 @@ void ether_setup(struct net_device *dev)
 	dev->header_ops		= &eth_header_ops;
 	dev->type		= ARPHRD_ETHER;
 	dev->hard_header_len 	= ETH_HLEN;
-	dev->min_header_len	= ETH_HLEN;
 	dev->mtu		= ETH_DATA_LEN;
 	dev->min_mtu		= ETH_MIN_MTU;
 	dev->max_mtu		= ETH_DATA_LEN;
-- 
2.56.1.839.g22a8290db9-goog

