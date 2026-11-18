Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032319;
	b=vRYtNsn/B64bemHvpdIqVh7QXE806QvoWG2PRvsj3i0ZLDKX9qon+s26dhJVM5JYT53R
	 MORA+Vo6QqoebXGR5hPWCeikUIDYrlXx04J1ttBs5PniFU+OuocxJpyYB2dq2EnUbvfU4
	 NUzEzDVgIWc+k9Zn2qwYkbxeIUcPiUYHboMripyg0jKxIqSFmJavMscw0+eaVWaUBQHQs
	 nZyPGvmSWx+b2cXcTTym3F9E9H0i88w7raAjJrWkIrzslF+oC61/yzWryRQpol9RRKVsA
	 dhhhm3BcsTmSJwLGUbqsmGpWt/8F8BBCLQNkcVmW+LsbXsSE5U4pGaopv97gTHi1JFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BZplnOpSYZYLf9hINwzyXjH3xpqTmffb+IXOPd4GLR4=;
	b=QMqhzuX7sxCR8aoRwqig/FwbScQIadEU9+MNSQrkhvvGh/4A1CSV6tfUJtu44BIGkdxU
	 Sd7JZF0STkx+l3LzUSkXdg3VgvlmmJpNeRkzfK2royizCkzUuxuk9seU6/ss8+d9YopnF
	 f0iYFKGAlAYqyoMfpJSCETnVugSSEO8kBRGMre7iyor/cbiONpasQsX8YhEIYbwNDyq7Z
	 d1xbB4BgPJoSMgiNFR1xqfeYSnhF95Afd5LdkizrDNoMiYvoKhCJ+G+N/2OFKTi8yQgC/
	 Smrbiv9DFi406HjDDfEBJmVPeEc3dXkM1L3Ix9Rfp/N+JGOeiRGlnZb/tRBnDhc8pcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUvJnVHZ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAFB60A260E
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAFB60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUvJnVHZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-382f4710a17so1796494eec.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032318; x=1795637118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZplnOpSYZYLf9hINwzyXjH3xpqTmffb+IXOPd4GLR4=;
        b=JUvJnVHZqurjYHq1C0KX5/Sy8Vku8v8wxCPRuzZpNiECIbe6+7XinchU5NE1t82Pf2
         KZLYL+CXK1HGymg/V6CXjLYUYv1sNjw9b3O6HsVubiUL2gJGar+Q7S/9XdOawhPbMw2K
         9rY+TetecM7K9HcNYrXHKNd7TItiE2sdMCOLJbYnYNmr11wW3f3t+bgLKYAk2QDEv8jH
         NUwt6aU0c5XimAnH+FhvyLW5JXjX9lFyEXsMiEJ5sz26Z/eoOvrfsqu0pAeX/iOXaYQI
         F3x6k2s6JG2VIvhS5NIpbroKcwepmQ2jVRr5UtuKJd1FQCyQes3JAOEmC514WQFZQLHa
         AJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032318; x=1795637118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZplnOpSYZYLf9hINwzyXjH3xpqTmffb+IXOPd4GLR4=;
        b=NJm2wVh0zUSB+dS82A6y5wMXxLojDD1PWcwAyKJNqTfmde3pbNbEoZlAZD/EAZ1cMc
         TYVFIAU7tprchZKYk1Tv9Zt5tjQ/Qphx82sSCDKkiA3ueLN0wpMLjByqy2WbSUfcHSYs
         ukrYAAveAR1iEhFoj7egyCIWho5C9Na9qqrthiKh72aBDGQvY769F1ak4s7k0KFPRTbI
         qbSWKIY+8w57zEZVjq2FD7JnLh9fyPA9Z1t2XtRomHCSKMzDF31v8N+N5xgDtMWiyB+a
         ep5fRpDlxlqzN1ir2LTO518PaSxdwtLxQ/6jxC1HpGjr70DNMQ+zxjgJFXI86ss+GaLQ
         B+4g==
X-Gm-Message-State: APuU4Z/pP6m1BQaMLx8uvatpu6DTigj3/JWbbYKki2KdbsBrDG9Jb2Gd
	cYvG2017rQJFOd2eYonei7KTY4YS97cMI4e+ioKNpvqIW5+PFOnamJASQFypWUpu
X-Gm-Gg: AYBFou290G1egOGiTNxa248wQYSzE52fg3004vVAHC/IxHOiC51GNSoDQXwc0zYE2Mx
	FVF8NhEfLDFU/xXcIvz7LZxPsrEg1ZZy0kh8qIpb+AkVlttKzUuqhBLrPuIEglbrTFx39kP824q
	eZAbf6zFkTUmI1cjzVyDP9MCTfLS+VUxZKmhcl4v95rE0gsBfpsJLtQoTYPKnMq6Smehpdm0JMX
	5zHi05nTTOKykdb6CnWG4JtT4swX1bcqwlZ7XYzx5Km9ci6fAYrZGFc6ws9Uj804TnNIh7eKSw+
	t2qVWaG3iBtQ3/JfKbUxt7p9P+viS8lCNcXDykIFoITqyT4LeyHQxbnfUgJw00jXnaw0uLePNZf
	tddzIXMMMPCPODuCHsfzPUMYJuDvXahS/UOOLiY8Qd0GfzpYG7B2A0Lj9/WcE04Hqt+ayf9rW+4
	JRcWxml/MekG7kR+4iCzOxblUyrMJWY2CWNL4zDOiEl/ipG9oRRTTZtmLlpRKFi4eqLKy7xDEJF
	/ije3cu2ewn0mQMtB7kXRESrLnrctBZbRQsmY0Syq/mtMKhoUlVI1XoX5xltCowGbdUfOIRjgqf
	HLfYX6Y1XlVMGyN/VLTjFWO7fn72OyT8O31XMhoeseyHXvm5fkwRLsITfxR8CEjPArS1iiaIUWM
	RtZGlJdpYhU0lABMKkIlJg01bA7PS
X-Received: by 2002:a05:693c:409a:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38280c2fdd6mr3790822eec.18.1795032317937;
        Wed, 18 Nov 2026 12:05:17 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm10506308eec.26.2026.11.18.12.05.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:17 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Wed, 18 Nov 2026 12:05:15 -0800
Message-ID: <20261118-timecard-common-301f823ddd-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
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

The selector table index is not the hardware selector value. Passing the
index to the SMA setter can select unrelated signals, or fail on ART.
Use the table value, as the sysfs path already does.

Mask the direction enable bit before the frequency lookup. Otherwise an
enabled, direction-configurable pin has no matching table entry and its
DPLL get or dump fails. Apply both corrections to all board variants.

Reported by the netdev Sashiko AI review and confirmed by code
inspection. Source-derived C regression tests pass with ASan/UBSan;
restoring the faulty selector, mask, disabled-state or DCF value makes
the corresponding regression fail. Tests use stubbed MMIO, not hardware.
The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
physical card was tested.

Codex prepared the fix, tests and changelog from the review and upstream
source, at the request to separate common-driver fixes from WiWi support
and validate removal ordering.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 478f7012b2..d449ed8ca2 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5900,7 +5900,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (tbl[i].frequency == frequency)
-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
+			return ptp_ocp_sma_store_val(bp, tbl[i].value,
+						     sma->mode, sma_nr + 1);
 	return -EINVAL;
 }
 
@@ -5918,6 +5919,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	int i;
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
-- 
2.54.0 (Apple Git-157)

