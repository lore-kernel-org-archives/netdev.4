Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.146.106.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795301453;
	b=JsYK2YjlfmpC4UUcKNBiT/eUEsPWrPoQR3tcah1bIco68qIyHrzFomi7lZtl6nFXK5sj
	 1qcVgYRgJC3HVqjGdRtF93hjMXNKD+zBXLn0qbUSe03cNzEhBMDKmAvVUGQEjeVIva4GR
	 ipUcs26S//NYtU+NtS8r/E4t3/+GdbwauctB+PWjT59ypXh90d/XejdAX0pMz544aInZ3
	 EnbN9e/4679F+zTPNgspT/+cu0BHLgzw0gCACam4g2IBIXbNIDZeAO7zKkx1vZvA631lX
	 z+wgIa4WO1vAXakfImKI8ZsOIRxdh/d5AHTNO8pU6F0d822JJUWnqaxZLRrB7fTkGuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795301453;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=c5oP9ex2gKQC9XOc6NFSr7DB6WiPxByJ0WCu8nSvzmk=;
	b=nfieodxy+COaDN9Olb/65gj6hveBGegouXgRgpROkXIHv+x43o5EmICZM+7Xbi6yeQU/
	 uYx6KWzhfIiuiOhsgTK7E/UCLGim+E2Yd31J2TzfDFTEP/sNqcqMc+HvTtNjBvTqr1WvR
	 fAS0o+mbMpwtmOFp2li39xX2bJC7p7nsmg0Bb76uKoZ85fH5MZ0QX6DHomTO4qRLwzyNG
	 izilT90YAwDMf6ELJnMLHWqrsC5vkPQHluXzTbS88AIo7OPS9di8Iz2DMfZo0oEuBpT1f
	 W5qbcNxh7rTIPIH3UdizBf5FMVJ6l6XTHWS5SipsxmeLDYQgtgQQ1ZTD7cNEioAdBkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dressler.pro;
	spf=pass smtp.mailfrom=dressler.pro;
	dkim=pass header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b=a37GJ+SR;
	arc=none smtp.remote-ip=62.146.106.33
Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B751606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 22:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B751606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dressler.pro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dressler.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b=a37GJ+SR
Received: from machine (unknown [37.228.226.218])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id CC089E0AFB;
	Sat, 21 Nov 2026 23:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dressler.pro;
	s=uddkim-202310; t=1795301451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c5oP9ex2gKQC9XOc6NFSr7DB6WiPxByJ0WCu8nSvzmk=;
	b=a37GJ+SRKm8DuHf89VC2mIIj9kDyxzz5XV/hp/sKA0gYHDEKJivy0tKNqhtrirFJBu0F/A
	KhYuzFuEXo79khPWrq/ARKHNQIf2ja1ZlAwZSiL9neAsuJ/jhg69bwTkjCpZGGlQcfczEL
	8lcJQ+lpXL/5rzk40LoRZRru+fDB79F/olhiDu+fX4XcDWbtjsZIvfkKE8rXv5e4NE018o
	ng/AXhS5MVRem7jZw0KvOFzgga/QTmWS9eZDWDU60FAHsGrjreYSn1eH3K1YJ/srlHkaMS
	n1HiCKHjv5MfSguFDvk01VbtNCkPv4YKYVysretUItK9lyhtMhb/Coh5yHZkpA==
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=dressler-pro-0001 smtp.mailfrom=frank@dressler.pro
From: Frank Dressler <frank@dressler.pro>
To: netdev@vger.kernel.org
Cc: stephen@networkplumber.org
Subject: [PATCH iproute2] ss: show the process column for -T, -Z, and -z
Date: Sat, 21 Nov 2026 22:50:31 +0000
Message-ID: <20261121225031.106742-1-frank@dressler.pro>
X-Mailer: git-send-email 2.56.1
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

The process column was disabled unless -p was passed. However,
ss with -T, -Z, and -z still collects the information, and the
man page requires them to show it without -p.

Fixes: 84c45b8acb30 ("Reapply "ss: prevent "Process" column from being printed unless requested"")
Signed-off-by: Frank Dressler <frank@dressler.pro>
---
 misc/ss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc/ss.c b/misc/ss.c
index f4160f59..b5430a01 100644
--- a/misc/ss.c
+++ b/misc/ss.c
@@ -5787,7 +5787,7 @@ int main(int argc, char *argv[])
 	if (ssfilter_parse(&current_filter.f, argc, argv, filter_fp))
 		usage();
 
-	if (!show_processes)
+	if (!show_processes && !show_threads && !show_proc_ctx && !show_sock_ctx)
 		columns[COL_PROC].disabled = 1;
 
 	if (!show_queues) {

base-commit: 87cb3f4198507331b9308689d4a726d17db63dd3
-- 
2.56.1

