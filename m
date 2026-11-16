Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819607;
	b=wCCjKOI351+6+1RN82iKVKH9CqJ4QJqBAkiH3Xrf9T7YzplrIggTvnHpm3v/6jL4lvHi
	 0hgX5JxkHm3K4K3ESCICerSqtihk1JFKm2CIRCnM9kGav60/ZASveSz+IsG7SgAymbi72
	 eYTsl9muqhyQvKPZVFQt+V9K4r18TfSUQfa3Ill2KH63lUPn5Viioa9G+icpcNYOI6+nK
	 Ql7JsvZoNtadkVDPxwpIOyHWRGBZv34klosnp2KyZiM1YchhwwvpOKnJ85lztdAEyLDtr
	 3UtDTr2TE4nTgkJSEC/XH/u34UPrp7xZiWXNULrw5/4N/4YZn6yQvRA1Q7eAFGnhM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
	b=R5ZCnE+pI5TdDBpzPqVFIeNBsb9kJpwV0YmxUnfroV3a5ECsmr0EBGt8EhT2oKtRTG5y
	 KqbXuygaWIbLJTfPW7+C+UIG/MOZ8yaOY+jzrq/szDWhLJQA56QkBu7BznekTHnyWejs2
	 4hW5H3vHb8nNDt9nZOO/x4sfWP9VRpb8CxPTyaYTgezj6+QEiSWPHDSmzxQByDof7ahg1
	 1XSsAtJpKAGYYt0nXG5y68yDTQyQGJD7GiOAaI4fvGU2OMw/F/Jyv//cqbp7TSbzZo5Bz
	 QzmiJm1PXqYIuLDtRNtEj3J8+3Wlz5iczX5keP9V8Rxqlej8H+dJY6zp+yVOUsz9bDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntpUZCCb;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38020606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38020606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntpUZCCb
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53dda625f63so2931966b6e.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819606; x=1795424406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
        b=ntpUZCCbXm2wFhbFbXhsgDTYNZw2HUGWwUUSI1oSVaNaS9so3zTtXeSudQXXoe+UBf
         Gfiusd+Co2+kmkuAsIQnUcjr1kF7T6FsXcXTbOWDCfK2fy6p59B2mnYdGl8b1f6W2aGu
         nH+Dd4hUUABrz9JMx9W8SVvgirD5x5KLgWo8ACb/I5IgI6ClVp2y09eIODbmF6qwqS7R
         1HNijtv7tuMN32q6NnPYe68MyuYAagEaTQD0UD9cpEeSiuA9vLSA+4h5i9rYaqbOImsQ
         z94qxCJb3F4FZzrEhETMsravLSPaxpVXOV7eiIHRVSx6TsJPtaco9zPon1VrBL7ROL5c
         FSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819606; x=1795424406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
        b=bxoH/X2Oh3D+WwGxrlOn1nAEuzEXgfKvU2TgT7ygpTsNDgvUveXghTh6gPHJwd1oaP
         Ulm3gDjMcs28M/IK+zmQWx2JEUTqsGBDVbW8pBDt/gQaBktyDIb6X8fK3DJc2hoTvrF2
         9Nuo7ZL7C0kehU4RkhC25qcjLQAAK/Mg4tTaQZfgnO3XPaxwNc/yIiBVHKtI8XjGB1tq
         6NGnUaBq4UGXWpjevHkWiu0KAC9HQAdEknO8TaCkqk4O7DOUexKpzlmggVtbIy23N+Bf
         xS9BH1TAJWx9He3Q6U3smo7R/Ag1EMVlwLs6Zlf9BOJc+JL0oPQ4EDxiw6GoGzvBSveN
         TlXA==
X-Forwarded-Encrypted: i=1; AL+hErG4ujc47OhgdngDSxgfVxpgDssYCLuAAR9UvVNgEev1+1KigrVzAIJ3v6yku6t1O00MXbU+PH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O8UgBQUy9hf2/TtyyFCUf4ZLxfTp53/Q5uiB65KLRyNFVLCsH
	AvMvcOzsvRBgHOA7S/TxD07DsJG0JmtO8MS6ZgOjfqWdUe3qUTzDsm64
X-Gm-Gg: AYBFou1KPWHChYkoxiRAE8uA0y9ds1B2X05BZhAt2dQPTTyS1LbaYHFPFHpb0OxgJgC
	WQSIKVSyKFEjcH+XBwRtWTDMHmrCQnw5I1SpdD6ErcLvYNg7kBSMcBN6wBtLxs9SXJ99CuuWraK
	ffSRo2hda9OXVgqE8Kfz654Eu3t044ThEgV7qgH5zwC7K+zYqH5eexcjMt2FYCf8X0QT5Fiefe/
	oW/j2Km692gdoOlPPm8CInDGwQ+dc4U6rGPYg+oN83FO+49uQ/idco7YUXU1fyXz5eU211nlooQ
	StNiM9gdqrU8iNv4yRkYZ1IAlppwzo3Gg9stT7KJ3ORo9ZMPexHhELYY3EpSgx+atC+AGLrHE+t
	ArTqrTGvOQYCRsIrm77irwxHcMSvzO+z/N5YmMU5DbeaDa/6AUPfiG9NXJ1tBL9gIiv7YE4ZOT2
	jEcagkXdBNPFvwSknt3QBIziOhJnzr1cDgehZBSSJeG5Dw00Ru13i+SjmnUTPvhRbjZATLqXtB3
	6FqdZvoD9M1YeYjtoQ+OMZ0PxQ93p0hw8ZHWvBzUyy9nrJi2P3MVoH4H6zDO6lZqWUDbo29r5xJ
	76ZDR9IXyD2GN35A9MLGp+NJlID8wnMMFutJbzOtt/JSZHEr3Iith+aM7KEj5scPuLU7UoAEY8n
	cwkewT1+SMkEG7rpPEwIYeIIgJbkeRDnIRUMF7BUx1jYg/v4G6GwqcirJIaTtrpB96A6EpS7xB3
	9Lwh5u+42HegqPtN+nvcTPngbmF7jM+no+1kNdAVr2KngcPooNIcVenOtBcsxAZkoqnO+lU6VI
X-Received: by 2002:a05:6808:4f60:b0:572:d0fb:ae61 with SMTP id 5614622812f47-572d10afddemr4314071b6e.49.1794819605661;
        Mon, 16 Nov 2026 01:00:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 01:59:58 -0700
Subject: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Some PHYs count bytes in all received frames, including frames with
errors. A successful-byte count cannot be derived by subtracting a frame
error count because the lengths of damaged frames are not available
separately.

No in-tree PHY driver currently reports rx_bytes. Define this existing
counter to include bytes in frames with errors so drivers can report
their hardware byte count through it. The counter describes reception at
the PHY, independently of MAC or host filtering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/linux/ethtool.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..9c3f079d9573 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,7 +481,7 @@ struct ethtool_eth_phy_stats {
 /**
  * struct ethtool_phy_stats - PHY-level statistics counters
  * @rx_packets: Total successfully received frames
- * @rx_bytes: Total successfully received bytes
+ * @rx_bytes: Total received bytes
  * @rx_errors: Total received frames with errors (e.g., CRC errors)
  * @tx_packets: Total successfully transmitted frames
  * @tx_bytes: Total successfully transmitted bytes

-- 
2.53.0

