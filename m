Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495370;
	b=Uo3EpAqc/cdVlfZsHkne+fOSm+0ldyRQThC1hcpYu5Cm4+qVv2l67YZPTfIkdaTYLVOQ
	 hfOKEcm/8awR7Ashr56d5UDynfaucS2h1t2sXQJrqwlamPZfMgtsf0oYeLxxfyqw78YpD
	 smucCWGXqwQ5I9IpD1MEKjAstrdhE7nbtrn/wR97n8LacGacKXLZSfEMG5EalCLw3OAyl
	 P9C6y8aLqVzEgt8vW96cg99qTCm+P6eFLt4t2tF/DI9c0mJUjfxfIJACnOG3UfyEafP76
	 bBsBHX6Ocg/UEGI1dME35STkXzNbVzTojGBZfYDxQry1EZ458TvEzSqJZ7vToazzmBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TTOETvouPXzmFdByLuoUtaMkBQLS1wjKXyxj4FAfEQw=;
	b=bunNeXGbvVqmCPybzpv8ccQ2xoMWpgGRFEVEoKl39aC70jJFtOHB8MhC9wz2moyZBmah
	 28jXNL+yKnVba62FMOCgiUsUQEmEMQ3GZbdTKrKoVZUZnhIZYsdSENkijBYHbvPsqjNow
	 w6ztsZNBBDnyrHSNS/ROOI2dxslM4aBRjmOc6X8Ws4aCaWqB5tVQsFdtM9GdxjybnTh9i
	 0lEJOS0c2LfhigWLXis4mcP07wKO1VTGKhUnMmaALpLKaCqgxWbTOJ8QO3fGb/QpHo2bU
	 ++NcHIKgx6s/hko6/cpcwLv1ZhkmouEWAkF+JCDA08SSjwBV9b/hc4Slcq37BXoONJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbHPTQLE;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DE460A260B
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DE460A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbHPTQLE
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so5786811eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495370; x=1796100170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTOETvouPXzmFdByLuoUtaMkBQLS1wjKXyxj4FAfEQw=;
        b=YbHPTQLEUcHyz6rThsktz/NHerN8yx76WldC5cJjUte5gnydyM6dkwDb5Pm33cjDSj
         6Opk9mR/dsJ/4VYjs7pEJmINR2wkRXlofpJfh998lrgrAlxsrj4Q1TWuJGEgWy0hb0y9
         6VPmRoYdRM4+6K9zv/ypsnMvhpWyiQP4QLLjxa97FMjSlgn3mGu0GmqgglvlMuRwgFU6
         grUSbLzwclxmT82NqWWuJ+x9cTyw8oahlyhVaIf0/ymjYDb42xRaXPDcCGw0+mgklvGI
         aM+8FY48U3whzjhBlsnPOvnEeUD09TLIdCLB6OsVD7tOl8FxNnburJaHo5pBRphQH5r4
         jGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495370; x=1796100170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTOETvouPXzmFdByLuoUtaMkBQLS1wjKXyxj4FAfEQw=;
        b=g6FuOIddA9LFHGIz32Il9DAEDE1sd2P7gAZLW6K6xc0HcbiuAcdZwQy1QJyHxYFPBT
         GACCiBUCVIcqUmMvVkczd25DD2+3f+UhPeFJxAfJDAPKt9u1PCak6Lkp8kLl3Hj8L/ql
         MjPFvjez9rgELsgv2KJk26YLiucZkeuqdZxDVOTgbgFxM9I9uB+XzBai86Ixgxezfdee
         yE1VAJ+K1iDXZ1/OxqqlFXXvnJOcipv3pAPgjHr2TfbcP4XafcVunH4DAkSH7zxoD/wz
         H2hevb31HpffZIVuc70MSqgLDMGAnhuUvoamjxlva+ut/81Wt8BG4p+bTSYr2krholoB
         d1xQ==
X-Gm-Message-State: APuU4Z8h6dtQSp1RhxTrXH+H6gH9M5G6FqcPbVHpWcOpYFUl3wsQBJD4
	dy5XZuvQtVUjWGYzo3DFB2eopah2NcLINz+OK6EXk3MDfHwkxtDwkkpAhC0/sZx9
X-Gm-Gg: AZFdTZeaN+8A5QubJ9bIGgtwbSSavfquqCg9PkXyc7TeZu9v1NYruj6BJbHzZ8d1uoQ
	zuVFm9qAAomg2+lfa96FYG5f0ytDdHEFBO7IM2PLYo6KyLsaFT1fHnEiXLl6wZ/UFPPnj5VzNbT
	fZdRoQOm3BdJOmMk4CIIgvnf7BwoEeiDuMtppt1nM8lJtjXj84NbulqOY71kShu+CeCld/HzJUS
	HU6YAry7myFMjDHwaeUslHAT1A15hvNQAUcQ3URtjFTF3DPQ4HyL+ehLzaAHaL5oF/TXhFqirWL
	EyabiiEaj3E5d17a2NgsKBOEno5a+NwddyDf0M2OUR0Qwt3DVpm8YmzqQQ3HmjcWc0E8qSFZTHE
	l0dU3JPjJn7/d0PuP3KE240H9XNXzn5zGgicdmcVs7eXlL0Zvbvg4EGcc2zR4YzZfDmtVk8n6nd
	6UuGd30cNZ5alWKF841ws7fVDcs3tK3bo0J4OdzxU2ZOCesuBBDj1RaeKBzP/+vlMkw2xJqS2b5
	v5L3cSGBD+C0MDjc1gLlBsPqid8bGxtysEGF9mStBSckg6GciNplgJqSzkG+WfZPVykB5fcSsBm
	bTD6HCGyE8clPd+Kt4dtw/+TFqm2JXQgrOkAk08giDTJeWh5xV3KHCd64nUeAaMFCsYqT8vA4KB
	XfiBaUI0g3T0QxnHoYkuXLLjGV7P1qb5pm+YdsLtEpUTgJ+rqgcoU2CODBhogC0q/z3IHY92H0f
	VSIfgRtwBsxOwO/Of9ng==
X-Received: by 2002:a05:7300:8282:b0:385:af7b:d788 with SMTP id 5a478bee46e88-385af7bda3emr12378687eec.2.1795495369576;
        Mon, 23 Nov 2026 20:42:49 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm34172821eec.25.2026.11.23.20.42.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:49 -0800 (PST)
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
Subject: [PATCH net v5 6/8] ptp: ocp: report zero frequency for disabled SMA inputs
Date: Mon, 23 Nov 2026 20:42:47 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-6-ahmadexp@gmail.com>
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

Disabling an SMA input clears its mux field. Zero is also the selector
for 10 MHz on FB and ADVA, so a DPLL read reports 10 MHz while sysfs
reports None. The DPLL core then skips a 10 MHz request as unchanged,
leaving the input disabled.

Substitute SMA_DISABLE for disabled inputs before the frequency lookup,
as the sysfs path already does, so the None entry reports zero Hz.
The preceding initialization fix also recovers this state on rebind.

For ADVA X1, the earlier combined-input fix already returns zero Hz for
a zero input selector and permits later frequency changes. This patch
does not fix another X1 -EINVAL failure; it uses the explicit None entry
without changing that result. X1's lost state across rebind is addressed
separately by the initialization fix.

Source-derived tests with stubbed MMIO and the DPLL core get-before-set
function reproduce the FB/ADVA disabled-input error and pass under
ASan/UBSan. No physical card was tested.

The issue and inaccurate incremental description were reported by
Sashiko review. Codex assisted with the correction, tests and changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179548551472.3135.11972018356692852897@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Split the DPLL substitution from v4 patch 3's initialization fix.
 - Retain the DPLL introduction Fixes tag for this part only.
 - Correct the incremental X1 description: patch 4 already handles its
   zero selector; the additional zero-as-10-MHz correction is for FB/ADVA.

Testing: disabled-input get/compare/set and re-enable, including the X1
series boundary. Stubbed MMIO only, no physical card test.

 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index c4c9d3501edf..e27abe2c24c7 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5897,6 +5897,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
