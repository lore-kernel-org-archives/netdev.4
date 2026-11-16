Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863394;
	b=ZzixgOeO6vnxQHYtke8IZFGCjOLKG7FDrWG/fjSJjA6usmn4CsRcV8PmRXIfJVWIFNJL
	 JbfBiwlaEN5ErmYoLH6agA+OtO9zuiLV1mJU09e/mxcbunsU+yl2RYRfR+32gV6Zr+Uwv
	 rvN9ykSzcgMX9gN/iJsRALx1GKd0jniifqdV2CKi+ZDPkfXXoUJuRmccdAXbBwMEGN5u0
	 EQhHr2PV+wPaJD4Ge/k/LElQQsqF4TEE+mCVDFi3pRR4tz77wguhVlEUI+HtPYwg1VWug
	 GyhtRCqnhmdis+qGTaHX08WnEixRXpy6zV7/S+RnoSfTdUqE4dwJzOZGRutkmkapCkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863394;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
	b=ad+e0ClbPLWw2QcmRxo9Eo5rqiZHFFzZJXGICc/PUXlVTxShmEVR6zGmwfImnEF9t7ft
	 lwOgIMzmUxqsehaVnoe7YKmOw3Xz/1wEiuOYdQnC5MKkzHB/fSwY0Zw9XY5yYxb2pd0tb
	 y0tNo9lzC0hjnsrS99+J6RwnFMVQrknsG02yudeLWE/ylAx6v86wCsedYsIdO6/GdPQch
	 Ztv1pMzyqu9I2NqUmUhSigPWhF5ANLk7F1ViyVB9SvVBrWe1NhjMVVcsJQblccrJZPH1o
	 sOw0H0HMc5C6JM6ikK6LqGkrrmHZX9AffbxfvsxCdSTpMJvCj6Y6X2SXZkHM6+DMXSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eotBeJSJ;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B03606A898
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B03606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eotBeJSJ
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3338311a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863393; x=1795468193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=jQPagUe3hMvee49jM3GGfuKtP8oMC1hpQOPK8pD7vo/IezVcTfh6SXH3eBuEy7+Qxj
         MKv941lITuBid+ck70i+p6j4Grkg8oWC5oUfMy0jNOIjQqxnEKoXOPo9C2wg7RH1boZs
         pEtJx0wz7REFIOUfC+pvuupylBJg7n95Gsi6FcNfdzc1V1QmdTZ/lLI5q1tTrHitj6K0
         C5+N9XgbnOt4U53VZwMf7eoJgJBOwdv754cnA5DrIhPBFDDpGhFB7+3j05cFCJicd7o/
         j7zsPGUCPY3dSLvgzKM6wKNfLlfRvD6BHFOmr642znKrCFdAuNcNwzyN+5USFGRNMVqS
         b8tQ==
X-Gm-Message-State: APuU4Z/7C2ZAi6MmygY6GiBXfP1kIfl+DFXcRhDimp7tsLAvENygIUeN
	yQ6+UYfzcNexkXjN68IYow06k6hucs/2+2+h6kASwiMKbWXpUOJqGxwZ9mTCnhmkg+5ohrtfWXn
	bHCsedy796NHEB45BTi/shatqTPK/kJuMxlKn/52BIrP46mvECeSa9LrozJO2W0R5dcaQG5fYnn
	JwBCh6qGUTn9hnx7Ve+AFA1KvkfaQJLh9TOKFsw0VmJcIBKpxv488ONstzzKeB7sTYyAYaTyBDr
	1CDkHDJJz7JACoQ
X-Gm-Gg: AZFdTZd1iWwu+LTRAFaLxY8vKlmbA/ePeimM8WDaAecigw2ls3I54D4lKa3UuHZpemf
	PHI9pbEd4LoolUHDIFZiSGYLMD2ndu8qW0pb6ag1avWn6+9hSXseTNAVcxjEDVcBvZYExUbCHtG
	LFlokyOG7aXSyBhRZqd407gtzLrDPJQtpj9mUqCJ69/wK6VKreLOOp8IhM3shBLo2BtL3UP34Fu
	cwUolCyKBzU7VUnwxVkHTSnRBZtJJb36MmpYkSdL1n7XEj8aRLlezdEiYNQukBkBbFQ1ccQxVjD
	a9DfmjISklNyMp7R7AOg0+L8UXlawHrcTtflaGgf1W/L8nQXNAdV1otPy3bACzi5evcZQbXghOO
	nM3PyZeewlkBOSVttoXhTrpx0JKJVMEkD0nMuMMR8j/whPrU3iDJ1qvnYYUN4qAnpE4CQ+Ht5r/
	RbG/uqBtjzlffYKPVDnO3VI3q+AHNuLqU1b4+yTbm1Nck=
X-Received: by 2002:a17:90b:b8a:b0:3b3:a9a4:8c9a with SMTP id 98e67ed59e1d1-3b3a9a48e5dmr652753a91.1.1794863393516;
        Mon, 16 Nov 2026 13:09:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b2188ff4sm3846516a91.0.2026.11.16.13.09.51
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363b06bcb2so34809821cf.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863391; x=1795468191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=eotBeJSJZsfyM1s5nq8TsLhGdHvFeMwEEucfH98IXW4j6bJrOSogLZ5hxAKjanjBBM
         WIseKzibz3915B5irt7q5WqIH3DBywqrdTmBxzOZ9dc1qw6/MnWenDTkyYH45M5U6nVT
         seWqe0nNQpnP/c5YS+Fm1jkFTlwerP1EODKP0=
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr187039891cf.68.1794863391123;
        Mon, 16 Nov 2026 13:09:51 -0800 (PST)
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr187039321cf.68.1794863390553;
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 2/8] net: dsa: b53: fix the SRAB grant timeout check
Date: Mon, 16 Nov 2026 13:09:36 -0800
Message-ID: <20261116210943.1352656-3-florian.fainelli@broadcom.com>
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

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index e6d14fdc56fd..7306535a892a 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

