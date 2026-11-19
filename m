Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115048;
	b=nX0/TwHSJYuhwRlYk88KpJ1TS3VJgYSGUOFKWvzNyBsGqEhqfBmFV2pJaZnFZgnwicNN
	 mhW9WbFaS+4SYqQaiod7wQMGA0G+d4r+Jbpm2VEC3kGs2AH9aT34P44VLH6O2TE0U1YMW
	 +PClO+XZ0XQk9Vd0ChQ4mffsNGIgleF8sWz5n0/7KwLoeJindHKiKmt8eTVWW8Wm/wW0o
	 1WRo9GwYWYKxfTxLNFEGi4+Y6cKNp2H5orq4ne0KjIad8Fo0xD8r4pv7/xA6rqX1UZuiV
	 GpKsHKQbPycclT7AWFsLpufhjnUSREEW9y2KWepElRmSGc1HvwFc1RIE8LLAG5qSxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115048;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
	b=AZocfo1nm55Vs8RJwCPVIZLQdWMT3wsmMjNTp1x5bnFkG2tYdRhW9AwF9vXQVk0/CJpN
	 bKKFmN4PbaZx7UFQMhPJVMAqSsqz1ADjMl6/yYXh0vDXxkWci9U6+qkZIQpEpK2uI51gp
	 98rP8y+zjW9N60cDHJQxcnzmXOnNKxf/SdNYXA8Ar9RstBKsCc+zUKUn1PKRcZ94gUOcb
	 TUB3w4v0NuVfRqDmFOpH6l0mevoRg1yqL/sid7u0gG3SBTx9dQ1JSidB5m6FxfZydjZDs
	 gufflF3sqG6+K3GIE2H7sEgfq7EtIQv6VsiiHrqxWFN68nB5Dwpgf26PVQgIxpjYfOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Y/Z044D9";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A6C60A2607
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A6C60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y/Z044D9
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cddc250d815so43882a12.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115047; x=1795719847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=pjGQojC6ClPSQ7ivBl9eI9ZgHT3iNSmqBsR3Y0iY+e7JKLC8SY/IKdB6ypb3wTS5Wq
         68sH9RsHLr3lH267hQ6+Go6pApsg+cuimHIA2tTkqACXEce10gPDL2ucL0OG7LwMoQsV
         FV5A2u8B1Ysq+jIZhSyTbYpbSBqzeDOKFG1d3lOth7+eI6gprrDOJUVeVkR0vgs6H72A
         PDr2huuBveKtuPTZOm8f980oA+D2c0nrO9WNDPX214mvlpl3ZLbfx+EDfpg0/x3g7mJG
         XG3TuYlQmi3UfhiKsXQT7QEghQHiCOED3vNc+5ahwu3ZkhsFEmA4I/kU9608wGxlKB+q
         CdXA==
X-Gm-Message-State: APuU4Z8+SHYhE28klKPmRhGmdUSV5ryWdkht/ydPd6qvusokuHMyEM5l
	zcJMn7CFqkXvJ0Xy3VtonEJu3UFq45rXq1SVyOwa+xFdEYA+CuXRaxFBGcpFQvFthxqdNyA+bz+
	YEt2e8jy1EXk1gjftqGTrI9o9+C0GVw1eOWJuPXEwe0k4iTzCQ0ZMgC1M9WNdFUyjOP/xNgf+Od
	FkoUgq2bARGg+iD+D1SOQEXSDcR6v8jI6CRo5QyWv6xHPIg/WWMD+Kt4SyUuXSWmuul7BGu/rc5
	Y3jMTqaEonaXLkN
X-Gm-Gg: AZFdTZdf88lRds/pXNJ+X1lEezaqcxuYUDSMMw2dauWGvJIETHbshWtMBocUvfsPbk6
	fYE0u5J9b3THsGiPShgZlkcjn6EIzS3yYNi1LDMszlxpvBmJ5/Cp+qTv1h4BrEeVSeQJokWMuxv
	w8i5idb2PW2DH5EUmD+8NnA7E0nSgmEL+SkYlYawIfkYDSNXhiiNnrukUE75yPtU69JWqhPlgg6
	A5medjBD9STZk3CNMtJiRijli/w+03Oeo/flQfdG4xzGQNWZ4mpmGgZuhZcJ1EsXK69e4zBQd7P
	KTv4T2dOuRD3APQH8+oihSj4y5LZmFuIIzEojIA+j/v+lsXN8cNTKX9Fud32dbZ5ivk+diNFyyt
	ijrGI2W8spyrsHZ473/jd5b0wzq+k/8zp4kzu0ZqHkpLEDMmBjuNafkN5+IDjjYI1oECoZmBmJ3
	FTAJFIFUBdYAZF+btdP0kjWpPjTQW1/Z0cMhp4wA6Z
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id 98e67ed59e1d1-3b41c906b61mr254650a91.24.1795115047099;
        Thu, 19 Nov 2026 11:04:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm289009a91.3.2026.11.19.11.04.06
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920fb8b9859so3877036d6.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115045; x=1795719845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=Y/Z044D9pMBqpKZcu8vYxIg1rJsUT+yCsVdmVoImpOjXdJrq+IRhuxUEW/qzI1GS5m
         HVgncLNXMPbrusbLuM3cLlK7iDNJVik8rMvMwLH23C00ysbAMuWxzsk7+WCHC5btpPYS
         QUp2n501CTe1gLOIvH0x1je02ASfyYUumFBGM=
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr99350285a.14.1795115045263;
        Thu, 19 Nov 2026 11:04:05 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr99340785a.14.1795115044633;
        Thu, 19 Nov 2026 11:04:04 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:03 -0800 (PST)
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
Subject: [PATCH net v7 1/6] net: dsa: b53: initialize the jumbo frame size register offset
Date: Thu, 19 Nov 2026 11:03:43 -0800
Message-ID: <20261119190348.2317702-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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

