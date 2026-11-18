Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999090;
	b=poJdkrgYblYIeX/SWe4uXo4Tv4oVjM27yS8GjfwLeGCVzyVGzujkt4cdLwHBElYAUtGe
	 jQMuwPtlXLH8UXFJWpxadcSfy5L50TCywcxt8pIOwL2hr3htKn9rHMAAOJ+AVzL+23IlI
	 oMMCxWL8vtf/1gTlmj6hvroDXJI5h7Sljq/kGxnhEFIWZgEAA+XdMzYSfZ03mAXMmqXTR
	 X4RIruPP07Fh0/djBJiR5ktGYcIoFZEJB19YwCAo6QtbbVzUfY5hNs5ZSSl44Te0ZKM0P
	 VltDIeQpYamT5OjcMk1yx2yOYhMzx8fjEOJj2h1qhIw1ifsP+WzkQroH6MCNiD2Y7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999090;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hogIZ9agQ7Bzwi4/vKvFreE1f3FvbDX2dyfqryj00j0=;
	b=oDHDVaXHshKF43PzRjoCsxglg+nb/tCFuYh3CE+uFE62IIrCJtxZl24PDeYmIMpCQogb
	 JWyiIy2RybvbVLT1N8nQ8ps5lmX9+uxySMdJvHWu/VKahIo4IhGc+6dcvuOlAR1J5cDCH
	 7z/OR5iGx3yGoLsQUdzfSTuCq96JRZaA3r2sKEPWg8IYKjqfjnRoe2bQBYj3traYtvidb
	 c7qsPim5A0X5AcN/osv7vUikNc6V3nrSSwJgEW1yc0xJc0BVmpyb+6GkFovtMrspsd7dQ
	 5Fxtb3MNtZ6USyW+gQ0J3C8NRMI7g6U++InOMJGsfE6JCD7l7t3o3eixN2++YXLdCVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MoeSRizo;
	arc=none smtp.remote-ip=209.85.210.99
Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F3606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 732F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MoeSRizo
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-843b6f8e2c7so748457a34.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999089; x=1795603889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hogIZ9agQ7Bzwi4/vKvFreE1f3FvbDX2dyfqryj00j0=;
        b=S1qX3FOvsJ4e44ZY91B0Rfx7c91hLbRUm6pFRPuDkpl0sP9OAkBwl3aHaJUizc6DJn
         w7BQW3Y3Uo8/MTEWfPMo2XKXthjIoeAFan53LCjQvFfW0V1fKuhxu2O69+BY6vL1iXAQ
         Gl5uqhsnqvXiELuuAzYu9YJFB6xTaL57Af5lPk2Hi9AynIiBIxD6JOZ7fRtHFQ1Pet7z
         iMrIZmv6uVDI9GAMEj0DdysWAKP4E6D5stYsH6WCrWxASotR/JcB+dm5GYL6ISwOVB+j
         Si3uqFEY1ZTeTQVbasx/rJHxPdT+Zz0CiKVMciMm58h8nv1v46aexN5hMjnooODHxWxE
         6VeQ==
X-Forwarded-Encrypted: i=1; AL+hErFT1A+LckIfiy0xr9lwwScwxm9A5nM5ojkPP2Mps4/gtiz+MPlUZjLGfeTJZsPGWG3tv4msLlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zRiSWfejCtwEySJE67O56RKV8WlsVW2yJujnLTlqYvRVg2jJ6
	7tf9XeFktJHHi46g9Iy3B08DcprEXqDaKAJPXLdJQJaHydKjiQIUaH7fX+ZKlD+JPyL0M2/2UWb
	6+PfK2AomQZQQQzzbd4Ipp5QaEzjzvkB3QpqJB13M/CRXrDAIe5avkxkKniP9R2F6Yn/xuN0VDE
	YpmnP6tk9LBb3GlPgRoT01HyiDwjGQSgg7qhlgKtzJ8SdTkH9cfYgwVcWF/YxIrotCpwNvXck2k
	TGSN3fzQY0=
X-Gm-Gg: AYBFou17oZWMgOEsrsPJWdFM4Sy1LTVzNJDCKVTK1Kd6Gjbp5KIjoBIdXYNRFaDTOqG
	YOKcWWEW+5BH64PPgdVAa5UK6mnL0bGM98kvde8O8jPDIRxFtipS4EV6DbMpOvR2BV8JhLnE9Ri
	i1VWqh8JbwPaTlKsAHIHoyxXRC7QJDTSNAwel9FLDhS3N4F5uEjboYMMXloK0MGuJPaOtQDQPlp
	g+/6b0d62849aZ7kf5xhvK1TfOXHvZLY1nPnEU+zTGsiUgiKif7skZ8yIK9NaKikfUWJ4dnphpI
	kEYwL/qdGEkAxDn4RVlF1Ujj1UBzUSobvm+PWkNCL/gsIVP1YEO2q3wntb67D07H8kZzroau6Bv
	5znvEBD9bM2zdqwmZqQ9L3riRwIB3Q5gmJj3ODOoBYaxlr4YaZu1gq4a4j/5doTQ7vzE4fCyO/I
	URSFqOw8df3vs9TSqPaueY3ow5VXwxhqhaSZZmNw==
X-Received: by 2002:a05:6830:2696:b0:862:aca4:1158 with SMTP id 46e09a7af769-862f0861aafmr1916575a34.22.1794999088941;
        Wed, 18 Nov 2026 02:51:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-862f013200fsm22620a34.2.2026.11.18.02.51.28
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:51:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so909910eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999087; x=1795603887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hogIZ9agQ7Bzwi4/vKvFreE1f3FvbDX2dyfqryj00j0=;
        b=MoeSRizoJSZdIKsD8jRU+MldHtUvEsBgs8+b3AuShF/RALkblJnkLoudXALmZizesq
         vJJb9NkacgPHDTIsMIo7/attNSyoQ0sLAoJlvBnG3QL8dcJEgnIgk+s0U5oIzJ4cNQGD
         s/T7MEr/vveXNGN4koPLPKlL+MTeW30REuaoM=
X-Forwarded-Encrypted: i=1; AL+hErHspGW7aJlKz6V8uqss4vznjcGEGkyVqdPnPhku3wKXXV3jGkn4SyMcpCADszyYcOiO64Yuvrs=@vger.kernel.org
X-Received: by 2002:a05:7301:228d:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3827d81f0cbmr2665824eec.1.1794999086305;
        Wed, 18 Nov 2026 02:51:26 -0800 (PST)
X-Received: by 2002:a05:7301:228d:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3827d81f0cbmr2665787eec.1.1794999085564;
        Wed, 18 Nov 2026 02:51:25 -0800 (PST)
Received: from pc-hpe-top-git-sendmail-server.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d401fsm6609311eec.20.2026.11.18.02.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:51:25 -0800 (PST)
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
To: michael.chan@broadcom.com,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: [PATCH net v3 2/3] tg3: Skip management FW version when APE firmware is not ready
Date: Wed, 18 Nov 2026 16:24:07 +0530
Message-ID: <20261118105408.1076095-3-pavan.chebbi@broadcom.com>
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

When the APE firmware is not present or not ready, for example when
the NCSI component is missing in the NVRAM, tg3_read_fw_ver() still
calls tg3_read_dash_ver() after tg3_probe_ncsi().  The signature and
ready checks that tg3_read_dash_ver() used to make were moved into
tg3_probe_ncsi(), which only sets the NCSI flag and does not stop the
caller.  The driver then reads the APE firmware version register, which
holds no valid data in this state, and ethtool -i shows an invalid
"DASH" string with a garbage version.

Make tg3_probe_ncsi() return whether valid, ready APE firmware was
found, and read the version only in that case.  Otherwise just report
the bootcode version.

This was seen by a user on BCM5719/BCM5720 with no NCSI component in
the NVRAM.  With this change, ethtool -i displays only the bootcode
version.

Fixes: 165f4d1cb3d7 ("tg3: Fix the setting of the APE_HAS_NCSI flag")
Signed-off-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 2cf9d2ea069b..5a0e247a4c46 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -15997,20 +15997,26 @@ static void tg3_read_mgmtfw_ver(struct tg3 *tp)
 	}
 }
 
-static void tg3_probe_ncsi(struct tg3 *tp)
+/* Returns true if valid, ready APE firmware is present, regardless of
+ * whether it advertises NCSI (it may be DASH or SMASH).  Sets APE_HAS_NCSI
+ * if the NCSI feature is advertised.
+ */
+static bool tg3_probe_ncsi(struct tg3 *tp)
 {
 	u32 apedata;
 
 	apedata = tg3_ape_read32(tp, TG3_APE_SEG_SIG);
 	if (apedata != APE_SEG_SIG_MAGIC)
-		return;
+		return false;
 
 	apedata = tg3_ape_read32(tp, TG3_APE_FW_STATUS);
 	if (!(apedata & APE_FW_STATUS_READY))
-		return;
+		return false;
 
 	if (tg3_ape_read32(tp, TG3_APE_FW_FEATURES) & TG3_APE_FW_FEATURE_NCSI)
 		tg3_flag_set(tp, APE_HAS_NCSI);
+
+	return true;
 }
 
 static void tg3_read_dash_ver(struct tg3 *tp)
@@ -16089,8 +16095,7 @@ static void tg3_read_fw_ver(struct tg3 *tp)
 
 	if (tg3_flag(tp, ENABLE_ASF)) {
 		if (tg3_flag(tp, ENABLE_APE)) {
-			tg3_probe_ncsi(tp);
-			if (!vpd_vers)
+			if (tg3_probe_ncsi(tp) && !vpd_vers)
 				tg3_read_dash_ver(tp);
 		} else if (!vpd_vers) {
 			tg3_read_mgmtfw_ver(tp);
-- 
2.52.0

