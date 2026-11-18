Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999094;
	b=mUv/OYNfGF2hICB7/lphqV8YFMn+hztup+RsCBF8pVprrkD31J+9dDFQoNzeHFLOKuWY
	 OAZM9LQVtCckCJ3VFfEs/4Ts23VRhKFbdacc450EJUsNpjWXVyi/YLWdRxaKDXPEt4dX3
	 tETF4z7ZndmT2qVODzFDD6zBSKyOqfIPkupAk4e5Kf2ycGHMB/LnJEQ+Jxh5u7rIUKzqc
	 fqawLwIm6sc1Idk80CpUMdhDEx42o/rqKK7sqe0eOAjpx+L3FpNPuhxLtSdwvB8jSZOVq
	 ALjMBI8hWz/EwpOCYnx2bgh24tZuVWBKgEi+6g2OLUXTLVOpvAfeEeiaSxBmBlO4+cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999094;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rKTakJucdmO2xGCiScMJ9STj/mkyZo+jLJhkz/O08S8=;
	b=Z5CTaqjWsvHwmK2vzlBOvdhsaRFxad3sJqQwuP8M3EbvsqgwbpSLPYpD2Z3QbWk5D1xv
	 iBGqIIwCuHPQgfU0MLHjrHKZU4rg1NtwD9990qAC6sClKo8eqdDP8+OTqqxfop7SEFOTD
	 YJtp7grM+jvIYgP8CIsOLuDQW2GHIUH4GmtfalICZi4ylCbpOBjcXYJF/CaYs9UNf4szp
	 Pb8yXO3+RUXIu/vbIjyGtffTCtjFXln3GSlXzs1Oda0Lzl2UJyHj07NYdkJ9HdOjasQrg
	 xXXUSHFdJ1xoQz7hCv0ErzMnEfX/yIdu3zZmmeVqwPfqx/3vkznfGlHx6w24hNzLqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="aZ23PO/G";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C734606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C734606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aZ23PO/G
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso417719a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999093; x=1795603893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKTakJucdmO2xGCiScMJ9STj/mkyZo+jLJhkz/O08S8=;
        b=jPSx7rFnMZI53V3nVeow+XQ8nJs0dJmoDq6BWNm/kr5qGL6gxah2Gtks96zUiyeOvW
         ZP47cL/kzafgfnrLhib7PgqpEZCKbiZc9ttyCUAwfRbG6Y6Eqn+xZA5kir96y8c6gFWP
         cP8UPfm9ksE9p+oNboOG6skpvXAKXr6c+dCqh14RnkpDIG2ay0GrFBIkBVUuCzNv/4IA
         I9cAEk82mONBSwgZ8ukRJBAb6mLsF6GBJU9IH8XQhcvKveRS/LljAaoSEJpVMFs3fUJi
         lGXvgJdYExrFNrPkShSTAQU/jUrkBYLgmblx7NqETaqUvgzMB2246vK9SYbcmZ8kgUKZ
         UUeg==
X-Forwarded-Encrypted: i=1; AL+hErGaojbqL91kziBPtBG4KnXxeEzzxD7k7CBMWJhV4zDwT+EOzw3V7yVpvPaRS0WKz28mhhKC9tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cYvWguAXXdo3C6QXSszFtHuD7QE+t9AvRf07KTGoUCrShE9Br
	fe+vl+LGDiik1m0BlDWywdPg+rVPEt9Yk6UPVJaNgHv1vOQTNbSJCe16+DGUqJxUFryAvpoK/GV
	HfqG/xgwz+JKgC1Mv8+4iu+QixFY9PjTCpr2He7OLT52hEAIDHvoc+U5494a0B5E7xmFAvVbV7H
	DBMsGrMfvHN4p7pJmT0wJkEuWCqHkzl61t8ijXGZT/HPKdjMzLhWhylv1NV3/+T0Xm4ALeA3hAQ
	ibYduh826g=
X-Gm-Gg: AZFdTZcszTae/+/mSR5rA57sAa5WKO//pjXnkylZmG2tJ6dkjs8gPB/cXavYbL7d0WK
	3CXU1UpEjUG9NkRbFBZrFOxz9ebPuIlcJEpZNL77v597kLZzTyeFsknPulZBWnK8AwH/uJHlCpZ
	+j1zRKasgKEX4gNEuH/dBzu1+ywCBdiUlXF7zEIMcZWSuvzQEOuU3DwbhZfb7px4O/ciA9cwFjt
	FEx0gXAVJEVBywYdarqBWAzatNg0j0s5D8LaiTMDf+APrhcvOrNJ9v+A64Y/8T1iAsssfTZ2Y9X
	9cC85UL0yvXhlIbGnhhQFwbsAiIP9hIId1xkGIfmxYMuIZu72B692ng/DfmVrwqIbh5e99/DZYO
	/3tlhgPbnC/vcwO2Gm1DVThFgRXvNAgiQ5WDTN8Iui2+Kp2uVdsFrAUSYcvcZN9mQoxGGIOE3Wz
	jDVmRMOWhulpMmfAq9q3RBizsBMLznh/SpCns=
X-Received: by 2002:a17:90b:1e48:b0:3b3:b915:2c03 with SMTP id 98e67ed59e1d1-3b3d0761355mr2203905a91.31.1794999092854;
        Wed, 18 Nov 2026 02:51:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d1cc7a0csm850702a91.1.2026.11.18.02.51.32
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:51:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-381dc4b8f40so1100669eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999091; x=1795603891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKTakJucdmO2xGCiScMJ9STj/mkyZo+jLJhkz/O08S8=;
        b=aZ23PO/Gnxs7drQUA4bTqz4Ju2Io8/khxm3ztSZngYfDI5IY3nfnSeqxJ44M2vLWJa
         1aYPiLUkEPizvfrX2Wbkjw8Cc8HAwB6ry33/0O9PNe/SHlBVl50csx7xLiAIy0otruBF
         S2Nbq8naIziaZtrZ4pFawA5seSS+Qhn0+NCCU=
X-Forwarded-Encrypted: i=1; AL+hErHbcAOAKNk+u0KUpAQLm7/WJFyjB5SYWWrq7oHEI0/XGOFl+s/GYTXkC1m8DKQ502AGq5irKD8=@vger.kernel.org
X-Received: by 2002:a05:7301:6407:b0:36a:270:ce76 with SMTP id 5a478bee46e88-382c39a3142mr1632286eec.33.1794999090396;
        Wed, 18 Nov 2026 02:51:30 -0800 (PST)
X-Received: by 2002:a05:7301:6407:b0:36a:270:ce76 with SMTP id 5a478bee46e88-382c39a3142mr1632258eec.33.1794999089673;
        Wed, 18 Nov 2026 02:51:29 -0800 (PST)
Received: from pc-hpe-top-git-sendmail-server.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d401fsm6609311eec.20.2026.11.18.02.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:51:29 -0800 (PST)
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
To: michael.chan@broadcom.com,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	Shravya KN <shravya.k-n@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: [PATCH net v3 3/3] tg3: Fix heap overflow in unbuffered NVRAM write path
Date: Wed, 18 Nov 2026 16:24:08 +0530
Message-ID: <20261118105408.1076095-4-pavan.chebbi@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
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

From: Shravya KN <shravya.k-n@broadcom.com>

tg3_nvram_write_block_unbuffered() reads a whole NVRAM page into a
buffer of pagesize bytes, copies the caller's data into it at page_off,
and writes the page back.  The copy size was clamped to pagesize rather
than to the room left in the page, pagesize - page_off, so a write at an
offset that is not page aligned, as ETHTOOL_SEEPROM allows, copies past
the end of the buffer and corrupts the kernel heap.

Clamp size to pagesize - page_off.  Also advance buf by size on each
iteration.  Without this, a write that spans more than one page
programmed every page after the first with the data of the first page,
and a write that did not start on a page boundary lost the tail of the
data without reporting an error.

Reject an nvram_pagesize that is smaller than 4 or not a power of two.
The page mask is pagesize - 1, which is only a valid mask for a power
of two.  A page size of 0, which tg3_get_nvram_info() leaves unset for
an unhandled flash vendor, also made the loop issue erase commands at
address 0 forever with the rtnl and NVRAM locks held.  ethtool -E now
fails with -EINVAL in these cases.

This was found by an AI code review scan.  It has not been observed on
hardware, but it can be reached with ethtool -E on devices with
unbuffered flash.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Shravya KN <shravya.k-n@broadcom.com>
Signed-off-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 5a0e247a4c46..12f199355984 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -56,6 +56,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/crc32.h>
 #include <linux/dmi.h>
+#include <linux/log2.h>
 
 #include <net/checksum.h>
 #include <net/gso.h>
@@ -3379,6 +3380,9 @@ static int tg3_nvram_write_block_unbuffered(struct tg3 *tp, u32 offset, u32 len,
 	u32 nvram_cmd;
 	u8 *tmp;
 
+	if (pagesize < 4 || !is_power_of_2(pagesize))
+		return -EINVAL;
+
 	tmp = kmalloc(pagesize, GFP_KERNEL);
 	if (tmp == NULL)
 		return -ENOMEM;
@@ -3399,13 +3403,14 @@ static int tg3_nvram_write_block_unbuffered(struct tg3 *tp, u32 offset, u32 len,
 			break;
 
 		page_off = offset & pagemask;
-		size = pagesize;
+		size = pagesize - page_off;
 		if (len < size)
 			size = len;
 
 		len -= size;
 
 		memcpy(tmp + page_off, buf, size);
+		buf += size;
 
 		offset = offset + (pagesize - page_off);
 
-- 
2.52.0

