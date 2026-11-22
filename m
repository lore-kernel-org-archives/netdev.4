Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359561;
	b=AC8MH6pvkBYSUiF8uEstnEQnnfsXxuzQSxGw+w+dgGE9+wkKlF4ELh9Vr0BbXgr6L24+
	 0jVOuaWGuEbMgMuE5DLxti2FriC3zhC+OvMYzcPg+0JHW6UTR+88PCPgjJQhqbEKLbz+K
	 bTsrrHY/lxdRVENHNMC9V36LRnZrPIk/S9VPG5mNfKkRhWoFL/V/dz1bql9caA8zQ7/eQ
	 /EUbMC0x+nFTBXNnegPObqvrQ8hZWarW4BvLrEzwvW1HQQ/kv2Y9rnSsG4/QlK0dY3B7/
	 a9p5mFOnPlIdE4LxL9XNMDZK8csGecCDdFQDVGgpPZbXLxUX+0paMNNOXpNUYJ5SwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yQ1mnXXpX8Ppp4sEQBFb/1XPRgAsvxmRrXL11uhRxSE=;
	b=uH1PVjeuN5B3MmMdADbAV+YW96fSGY1ku4zDZizpC6mYdcg1DmQiqqYJdKaxczdtH14v
	 G2PbMpSRKUIjx4w9pk6zLa6MSpBHUTEyRH2wXlRUO2jmfSwjdLC5YXSdErqVlhpPBb3Cl
	 CDjbpR09/20NgFLrkOnVdTuBqYOuqFPV27O9bpB64tO/+xQYJ2tZdXWDEdBRSDZlHKXYK
	 cWfrAu1EdB5wdI0ICjH3lJ/ZxiZXjCtmW7dmv6Yfmn9m/rea1LjYBgSVolxAbppmHP66S
	 3J07z2uoo5r1OQtvEDOiz9iXaCJ0/zOSeJF0A0LbsecZmwiLbyyt0eUAvFb1INDUp4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aERxkzmF;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34366606A683
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34366606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aERxkzmF
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so1595679a91.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359560; x=1795964360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQ1mnXXpX8Ppp4sEQBFb/1XPRgAsvxmRrXL11uhRxSE=;
        b=aERxkzmFuUkN28xwnMV1dFYkCXVVdce4HrnW4wlWu+Vro5TiEF3rTpC+Uugv183fkX
         A6ZpX9AEls9XQSb9KG1roun4Mh4hI4AyH9jCQwNk6jXUat87UolGU1I8aSqD1tkhAryb
         16XVE94Xth0TzQprV4d6mTthSdL4UpQDZEq/t6+5PPmEM+HeA94udq8xvbEZCKMdigzT
         iPvoQ27LHnqBJi3yTaptb4Qbkm4F4uHhpisdrGQk9hwpndsmtQNK425Vojir9hUKWTcb
         AuX6kHkfMa5RpeaPnh1CyPNTfAeMJwhJgjzF0lcdnHivZyJsFD7IvdGF5Wm3Cxvy1zSe
         r6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359560; x=1795964360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQ1mnXXpX8Ppp4sEQBFb/1XPRgAsvxmRrXL11uhRxSE=;
        b=xXL5KZf4qtUj7POD1q1tMEzAwbC0AASmXzmT0ypqvtVdIL4QfUf/wqxsDF5pyNVctg
         TmYvi+l1OPjtVuMj0w0DvNtwKc6HzvLVaM91ag8M5RKNk20AYxqI7LslZ09vvGtPhU2S
         bYcEDBjQE+UFijL3PWTl8PdstI1RZGskNHu8t6tQi9gDqgKr6F59m9vvOLS7dtETaSRH
         81reCxHID+2ouOqQjPvC73U4AgAwDSFB8UCVGPA/VdXkzslAvNU0w1Jrij6ziCHLhQNF
         UJnitlqppNverLFLPtcUrwYsbXJfFav+Z94h/pmBWPIGfwcso+Cr5pIFNV10O7iOHpQs
         j9Sg==
X-Gm-Message-State: APuU4Z/oPHTf4zuhuwIHgUC+ov7i8bPEd3Q4Z0jHXJ0mfdWf4CjVMxyB
	Z4ZJFTaeOv3MeQZ7pv8wfrDV4x+nqzZ1wsxI7nmxf1Y+OeMsQ+TU0C1aTcmsboNs
X-Gm-Gg: AZFdTZew5Fms9hzimO4vug4jFHKpolgx9EHjGlFmZ8kC7QwPrJoDxX9UBBHJv44t0Mv
	A231JuAWsu5kX2JrxacgNZ/JK4/eJLUvs73QkLuG1kZWX+/LFbOnP3go4ndrnQltot0w5gAwbNT
	ZGqvtZ8brnrojCUfObm3xzBICrhg/an3Eh6v2HiLSOjchwpfqBO5eghpuQL/u2tS+nSUFe5j3iG
	/dGizb0Rxt1KuEhT70SSJwB1RzYu823S3xk3F8Z8KM4rmW4cZQ0JjJsQlgYeHVR2DZjdetVohGC
	iCJ4FV55RkJVObwTxGgOzdWUapkV0fnMJUhM1/BHdww6qv/yKG9hXca757IjroOfDwctwRbpQ+K
	3g/rvWnFO2Km8Fiun0sbqge+wM7+866L4RxlbEdLDbbMHpVm5oWUkC6wscUqEciCihjj32qhqCF
	S6KQmSjhJ7vnLlP0sL+BszRpRiz/nqlLGT/CWuxK9ysJau/OuxC9NC6ajokJrYTkPhFkeJLvx+2
	/+bq2yVRHnm1GfrupIRFikdtPBVQbMIpjJ+rWLZPBg6e1YF4MG2IODmbjsPmGFwfeU3i7nrvSVp
	/069lBkiM3CRRwmUyzF3twhKd7kRnAMsYzwFJ/4xJZAFw6m5CQqKJKOOX22498Nfad4=
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr8477165a91.60.1795359560597;
        Sun, 22 Nov 2026 06:59:20 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm16387442a91.10.2026.11.22.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:20 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its type
Date: Sun, 22 Nov 2026 23:59:10 +0900
Message-ID: <179535729502.2645501.271186140389290426@gmail.com>
In-Reply-To: <179535729502.2645501.5219010464870440@gmail.com>
References: <179535729502.2645501.5219010464870440@gmail.com>
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

A bond can be a slave of another bond. Enslaving a non-Ethernet device to
an empty inner bond changes the inner bond's type in bond_setup_by_slave()
after NETDEV_PRE_TYPE_CHANGE, and nothing refuses that while the inner
bond is a slave of an 802.3ad bond. The outer bond then adds the 8-byte
lacpdu_mcast_addr to a slave whose addr_len is 16, the same global
out-of-bounds read as when such a slave is enslaved directly:

  BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
  Read of size 16
  Call Trace:
   __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
   dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
   bond_open (drivers/net/bonding/bond_main.c:4405)

Refuse NETDEV_PRE_TYPE_CHANGE for a slave of an 802.3ad bond, as team
does for its ports. Other modes still allow it, as
bond-eth-type-change.sh expects.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 drivers/net/bonding/bond_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index bcc12ef34d9a..1a926b8d28b0 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -3981,6 +3981,10 @@ static int bond_slave_netdev_event(unsigned long event,
 	slave_dbg(bond_dev, slave_dev, "%s called\n", __func__);
 
 	switch (event) {
+	case NETDEV_PRE_TYPE_CHANGE:
+		if (BOND_MODE(bond) == BOND_MODE_8023AD)
+			return NOTIFY_BAD;
+		break;
 	case NETDEV_UNREGISTER:
 		if (bond_dev->type != ARPHRD_ETHER)
 			bond_release_and_destroy(bond_dev, slave_dev);
-- 
2.43.0

