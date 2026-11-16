Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863392;
	b=NP8TO3/0SW/CSm0oqfGEt/TCo7XPM8T+C/CpCVYADiwbyTJeiSG2A6dDGtkSAbXV62vI
	 mRcJZASh/tnPCIux06SO1LaJ/gwLF/HR2H9X2Ed0gYET/A+TcvaSK4fBhbZgRPdsM5m13
	 MilPRb9tJEHGsociMd1kBLAoYa5mh+xeNcD+fJQGVPDADoeOUBoTmAtFIEMLj1mgJNXNn
	 GP/dC32ZUcFhhUfp10iqfPrF/kSsMzory8NgpbeurMa36ETyN6DSiWno1iPhpzIEvh+lQ
	 Zh+I2/rCAchBtIv8Pi9O0aWUi/hUe/gBh2MSMMAI7DPQ4wSB+SfHzebSI/fuzWFkEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
	b=DVE3qumkKnEV/naFOhX/BSe43i9YatFbhP5K+eV88HqG9iHqYhowZlMknfoSm5BOEFZf
	 I6d9Bo/JzK2qu7JUdpcDGr8xoSPyerhmV+rMFF99aJYmoM4Z5IgUd+u11WJAx8dp/Bkvp
	 KBJpOFEGKExArP0hzIh+rGwS2yoHD/KoXyXA2DaEHAhF/alm9LsYd3Os40kXpfJSoSACK
	 xdbadqW9NgL45Wv0OHo4URQl7PTaMHRSkL+g071caLVCM8nzRz4ofFBBdozW/ao5MKLYv
	 qUl35owotGRKEZGaXumdX8Tf0mA44FMbx0Da0uDWF/T5sFFiACTqVCCu89xfDLPiFNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WcJNw6Mm;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64B3606A338
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64B3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WcJNw6Mm
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so4828595a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863391; x=1795468191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=PNnxupjmzeUxLoGVenhEtc64ZvzEmU2YR8QtS3w2kAZnwC184VrhKD3O7yX0mt66h4
         D15XSu9SGQNuWvgzZnPoMcFjpEHLDTtKx+2iuLVbXwX+zWmP9V7G8KtQ3kPB8oTNsTyZ
         N6gHADGImtOLk4bpr6CcrHMzf4C7loSL2737k7qin9J2grt6T+k7AJ3NSSrTG7i3u3CA
         VFHzCbAL93glSfQUf2zf5QG40N4204DU2M6iSmSfNKVKvgVAe5rq6qtTdrqOAzbNjTBR
         fgSC/uOaIqMCmyAcIWBbnWRFlh/OT2BTWq0fCgkcA1of5nBVFENj58tJgAEp9CiMC6Bn
         lcvw==
X-Gm-Message-State: APuU4Z9m2/MhNQX9uVwBTVkvCBQFVMcwpeIYgQW8mEWtVuKA4eu+HmKc
	IoTvqWk37uzm50R7+VqnwBmCtSEF2M8uPaCVKOH5bC0mhduUPjBLoa982tOsE9Zdhk2Y+6/UOEq
	qkuilon5SMElIRaVW73Z0RmdyXXGDTaIyAvwPyZilEmRVZSzmA/QcMKKwCS/W2VvREofGmdscnb
	euabMmgvc7eaJZYoBO38Vav60AMHiQhziSi3DSySqjea97RrG8omCpO2GXCIohu6faSrnHdV8i9
	dTv1zPbgqtKtMBw
X-Gm-Gg: AZFdTZf3gfseeK5srh3qt45s76L+3SaoQDPfvyGjgyC2ElHfdJ7iUvMO0nDYbBO6wlb
	o5OmxYJvqUYvMJGCX8GzQRwnbTu2Mb2bkmzCQQfQ6kpPjOR0g+l3yKdxtAcpZA/fxJ8yF1ytDj5
	JLuFQdn1u2AhrCCQY28HerBwrQEZdSSxOQ/aw6W4boHE3aDDUgw0RjvixJLivt16DpM8aa4EBVv
	UGsgN5MqmYsYssGFQpA9pbLGgNygFYKYaYAuZCHiUyCNfBkTW8UqC2CvC/TV88Bw19USS2IGC7I
	e+wGG5t4GTt/DCRGJz7lTrbXUOfU2clY7dWenwbCBzRAUZJXR+3lpm6DJBKdsNJVhDQmDRxHHOd
	0hQEH2yXrSoWH9JlLmSAiwWA0p4bn5T5z6HhMgNP38nw/wkwQ6P9K8udDJ5FIlqEuSkmAdYfaYd
	Az2M3goqIVMKmq/Qm4qIfeCSOuoTZRCtz5Jv813bo+
X-Received: by 2002:a17:90b:1650:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b1b0b5b8a8mr12123846a91.15.1794863390789;
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3af69e8d4sm82591a91.2.2026.11.16.13.09.50
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920ff6971a1so1221876d6.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863389; x=1795468189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=WcJNw6Mm/GJcM6B+pBFfIlovBJdiSIzhdyLxYi6hmViPem5d+kmL7mRElBba+b1oyW
         e0prV0JA00ACra1K6iB36rayRysB/07XppYMQB2e0K8EHPGxeleWkAVV/NkC1JTG8jXd
         rO0+VDz76yupQHLH1LRsGgShOgTFjd/0BkOfk=
X-Received: by 2002:a05:6214:2461:b0:91c:6258:ec97 with SMTP id 6a1803df08f44-91f2418f879mr190160236d6.11.1794863389321;
        Mon, 16 Nov 2026 13:09:49 -0800 (PST)
X-Received: by 2002:a05:6214:2461:b0:91c:6258:ec97 with SMTP id 6a1803df08f44-91f2418f879mr190159506d6.11.1794863388557;
        Mon, 16 Nov 2026 13:09:48 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 1/8] net: dsa: b53: initialize the jumbo frame size register offset
Date: Mon, 16 Nov 2026 13:09:35 -0800
Message-ID: <20261116210943.1352656-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index b7aff5e238e8..1f5776dfaae2 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3172,6 +3172,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

