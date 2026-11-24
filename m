Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495361;
	b=rfheh4DjFotkM7YMkx5sKlPgQcQVmROqdBI00rWajktr7xnI3CuQxm2CwQp/TtgBTS6k
	 RoIifX/L3XgUX2kQfj91LH6p3gX4ITUoLkt/PA6jiV+D2JynpuKq8JB6N0f+WhpyFBI97
	 gbSCEzxsFSGf0aCgVEJboZEsJcXulKehce9opy4rkX28PsacbrHoh6fw/ek+qasLLDWSN
	 zfPcfG5UIcXnrRAjsfvBWAzudI5MpVluThyzMLmxA9lnv8qnfe206Nm+oneIzz4awF9qb
	 uS0KIC3s0ByWpEhB/AYLnConLoqxRUMb9HvYFtK5qL/D0JETJIloELjE9PyqxuNmKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BvJDTcvuQOXXqhLPEh3cehXwTFehGneZKEkUbgpLgEI=;
	b=vDpMCvGeg9MRwdY2oVjNbE4Z641hUU4j7ZxX57XnqXaktQqWwIzUO6ISeC3mGy+0Ilif
	 lndrn3oyjt1YvKQiyjBlvycH5NkO4VT7CFk1VhTjFdZ8/3cWgH8dRBlcu4R1GvNnrFCN2
	 7MsBMjbHh2sPpwnm8Fa2CaNaEXZYPiAIYCnzgHC3UCTrB5GrKSZZPK1YqY2CRDq/AXg/4
	 QAsuiozRB3lrfxD++t4zneQ55HSH9dgCIA/omKlx1f0NReNls/RryAs6kLLqpyidXfK29
	 lkxlsqvvEQ0/+xh3NuNibt5HogNxZd6yA2V1eTiPT+BofXZANU55wWQdvMtZtgqUiIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7nvPsjp;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E9606A69B
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 623E9606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7nvPsjp
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382f4710a17so6969510eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495361; x=1796100161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvJDTcvuQOXXqhLPEh3cehXwTFehGneZKEkUbgpLgEI=;
        b=f7nvPsjpauvB16GJA1/E791wYAjet/52LwfknhXpFK8NArBDoinDPLlSsHK6Dbunf0
         gNAXidNp36qWlRHZPMxs4Nw8Ffi5d+l22nDvd2rZv6Fm0yt47MESY58bM2MhsHPE8C9P
         NyL+MXly+IzAiGKabPX8r6vXwOg4HXBgMheRJkC5tG77Y3JiKsnH3tR6OJqc3RZbIfXG
         zHB9t51TPjMmGrLOYolD49iEJMTFskrfsZTPUaBmZGvh2m3yhzPvUbSA2MfFOBboA2pg
         GbTVedDF11Y2zXE7kC7wU5ndgTcyzQMgzj3T8aMGFIX9hiAsLwxW8ZdwvXzaWZl/bCQn
         HONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495361; x=1796100161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvJDTcvuQOXXqhLPEh3cehXwTFehGneZKEkUbgpLgEI=;
        b=Hy1wvrMPeivLYPF0OqTJNNdQlQTjZdNnqzd6h4WAqk+5UjDhXiwRck3nMyq+DTYUTS
         VHRv2nCiy2ctc385GZMfuvApR1eiOwBziWlmVYwTz/vnPKHKPehe8UfFs+JBkurstRwi
         WD6Ck6zD4XaXPrLgChpobqTIv1OZH4cQ7A4nzGTYxcx/JVEIn2N9hu6oS6sHDfe/CXq5
         O20/SB5OBItlALlNhEtfBf9O/mMDYsZbBKo6uSFHI1QMnp8nxhZjr6Ah2UZmob6IAAlX
         ajgaCGmdqKpRsW1KrXbnva9aCJZ7JasrPtdFWiY8CL6t6iVDNxOs7k+lOtnzAhOHr6zZ
         JEJQ==
X-Gm-Message-State: APuU4Z8IeXbnzYKUydabyH7uZ8HwLRsRBOg1CGvTQMa72bUEFpAcdEY3
	QTKUyvQ8GBJNE0AIpfQT3wqm+Jt6H+5UcsUxCg16Z2bWRI/dnLgFwS66/6/EP3pa
X-Gm-Gg: AZFdTZdx/pcRTJMuSxVX3DGL0VjDena8LxIwjZ+rRUOpEob236Yy3trnF4IXi/LHz/h
	3iB1pCrQHpFsdI/Xg7z7N49FwQdTVWJHeNcpA6wCy10rr9EZbuTnoiT132iPlRYSTsCoyHA1Nz5
	bAkGcBR9R+iH276PWOanmChQcPwuD2OKMI9RYyEs4H31acY7D8jgt/mGhWvSd+lke9FoLH77VG3
	MRSaaW568N6PYckUQ99p24wD+fm2FvKD5RTJ6FR7dhyUAbudjUGxvkpnjoQ+Cm4506wQ71wSEg9
	5dCwEKpJotYBseKOkJj8tOFcuXwlKpDMpwiJ2RhoAjGyl/7qFiZfwZFmEfxK6GyJae3q8HGxvRK
	vis3kTI6ssExJOSdYDIupoEDBpiOxGZJ1RLLOwADPwLGCCkI1JsDN5LYPPzcdQpeTac6p9w4hWW
	in2BejG465Xi21u2/JMcpaVqbwOBY62cFt55Hbuh50EfLNwRUAg8RnkFspmqUHj4s4qE56gJWkW
	Dn+wGM4Q+yUj9vp/YqhKR7TCH9Ax3Z+EIcWkrarMFAGmT5BlhuYt2RYkHJzTeQuD3LAepqpAqIA
	UAowcRD2C1BsbOoMhob3HN3LGkhkjyekA2QmpjmNwmxWeu6rbiE6dWlUfpgdHjTMG7ggbA7P0CV
	+yp7udXN8gbwmKFyhROjJjBiSpvKMpjOuzVGzqm3zzas3EaQdcr7NCCQ3lcC6mYF2DiTHCnrr
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr13830003eec.32.1795495360522;
        Mon, 23 Nov 2026 20:42:40 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm44950162eec.24.2026.11.23.20.42.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:40 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 2/8] net: dsa: sja1105: leave the pin function unchanged on EXTTS disable
Date: Mon, 23 Nov 2026 20:42:38 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-2-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

sja1105_extts_enable() selects the EXTTS pin function even when disabling
timestamp capture. EXTTS and PEROUT share PTP_CLK, so disabling EXTTS
while the pin is an output changes it to an input and stops the periodic
output. This also makes the hardware function disagree with a retained
PTP_PF_PEROUT pin assignment.

Only select the EXTTS function when enabling timestamp capture. On
disable, clear extts_enabled and synchronously delete the polling timer
without reprogramming the pin. This also avoids attempting the
unsupported AVB_PARAMS dynamic configuration on SJA1105E/T when disabling
an already inactive EXTTS channel.

The Sashiko review found this side effect when reviewing a PTP core
change to disable every advertised timestamp channel during teardown.
Codex assisted with the correction, tests and changelog. Tests executing
the actual functions with stubbed configuration writes reproduce the
output-to-input change and pass with this fix, including repeated
disable, enable and error paths. No physical switch was tested.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - New prerequisite from the SJA1105 side-effect review of v4 patch 1.

Testing: 100 actual-function suites with 14 chip/direction cases each,
repeated disable, enable and error paths; four x86_64/i386 PTP/SJA1105
build configurations with W=1 KCFLAGS=-Werror. Configuration writes are
stubbed. Restoring unconditional pin selection fails at runtime.

 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 350f958dcb2a..da35805152e0 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -816,9 +816,11 @@ static int sja1105_extts_enable(struct sja1105_private *priv,
 	    (extts->flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
 		return -EOPNOTSUPP;
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
-	if (rc)
-		return rc;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
+		if (rc)
+			return rc;
+	}
 
 	priv->ptp_data.extts_enabled = on;
 
