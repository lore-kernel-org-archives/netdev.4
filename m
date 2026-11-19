Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123198;
	b=wNF5IJUCMBM0KMaL378B4jV0rKfb2MlwMKbLX1IymzWacTS+U2ctHNHkn2dOZoo4KJoH
	 IJrlHvmaS5qkbHrXpzcLKmJj9j8fbSpkrz7yeskbmyfjK8CAxLe9ug3SawLyRE4J7FVSh
	 1kjDLn2HlkB+h45swfXoLJ9l8yrUxte452DOu1+9/ymzbBG+e85q89I0b0jnIgeJWjnn/
	 rg871xM7Pa/f8a79s11SUkK95OmKDPRquPcQbFpKPNdgIlk53k7mG4KVKMwOQ0chl++Ru
	 w1yT7UdJHI1EmazXUo3c3ODsBN7Z6IvJ4YR3yF2/qsWpxUl3mTxvMuhxbUkIZPvN98w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIo6bIy2VpB3fiCXQElb2jphCrJ8tjn81ASe7OOCnVw=;
	b=n0rRSAi+zyZd8/UHEVZEiWh6uqnBbQh+FS/jhdb6Ko8CHJm+MLaJ52IE0O9g5SxVIqwM
	 gvru6CRngaSaHEhJGgiroKQsJwmLx6/DPjuTVWJvhAM54TANdvbGivLhBkFBfkyMPcQS2
	 yc1Og3MY9cjT4N7QcKsUWwMGxcwCpwpXgUEhhhZMdyisBIsSc/6IJPwlsq9M4h+aSBkTJ
	 e/fcMHFnScGL8F3uLR+45X8s0HdHONKJBapliR7Qz7n1GDZ53ZRNV6AO7XCa9+HpagZhr
	 UDoxJGgQXJnTfUwbc1K+RiEOjjpEQq3Q/JTJS7ekOgmZ7FclpTfjscheNtVFLBDeSVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mv9owoes;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AFC606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27AFC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mv9owoes
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380b40312e2so408747eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123197; x=1795727997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIo6bIy2VpB3fiCXQElb2jphCrJ8tjn81ASe7OOCnVw=;
        b=mv9owoesxYgEan2LBkKuyqLy7Hd0bdqjHL5k3Bk3A6a9hQZGKbII8d88A3TRrivadh
         rGy4VlFEu1HEc9fFUM4tKgu2zxIr4hHlLhLrh8Qv3PvusuxnkYf0fP6DqFaUHUb1Lns9
         W+pcvszo9BxydxB2GiIhCY/OC2nCwmLrLwE3p1LR5gMMdhz6xxi6M6FBSrJGQFgk9X/5
         /+d9N3TYNcTL7dt9k9y42MqngAc1LLuRhyAF2S8qxPkIgmaM4VarJK8DFPquF3/0OMLX
         5bZiQsBN9acYMLQ2MqdF7qYSk89qOJcn5r8Kkt0YSVxiU0hc0byK/UzGwqafZPm/KsAV
         MNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123197; x=1795727997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIo6bIy2VpB3fiCXQElb2jphCrJ8tjn81ASe7OOCnVw=;
        b=gL7g6/2hq8tfNK4K1p1aKXVLNRBMnKikXkDq/M1B7MTvtu0QaA6PqbQyGoIxOH7fLe
         0DX0uInA7N3IptVTQ4wBr/0VdvBB4rrUcAZVTGt4BmtZ8auzqYwW+JGeZZsnVvPEFAsT
         PqFU6C1JtXr8avHkrMZaoX8Ab6HpAWezCEoU9lsbCDVcSuARYAuDdrvJDAXfYW9pWF4C
         0ShcdG42rnZPUbyYBru/YHV9dhau5gkVBdaUSEVP7QgCSmDdeBGOztvYTT0hFHMsFz5w
         lhIjeRkYR10GLpQ0ttjBB+d2LFnk9cHidVZ+FsHUfAOm6DiqbcKgtDG9xL78D5QOESAD
         VtjQ==
X-Gm-Message-State: APuU4Z/bmo7cX567ZbHPuFGvAeucKjxGpENekw66qVovy3u0HlJClXxH
	imq0Gj37f6isxfiQ13wgYfkKJV1TyTHyAiARGw2J8Tzw+4KlwF1YRPyFkwWpu3rv
X-Gm-Gg: AZFdTZd10cU+HvDw3tfMNAu25+und+L0aejAvN4j/RNglN+LndwgpQcS6SSDMid4lqv
	0e+7I03fbkCttj5ZnyxKqKIhdbJHlOcIFP338LRMAKac+9mTaWeaeU+gTnwMCbf9itmKZ1YMn5R
	jX5bnsx1VAbT2QqHsa0RY2osNdY4xz0bPjofp/g0vCB2K8neinLdtfPcKbh5dNlh2yv+xpjq9bo
	3DtGZyXwW1SWHwCLcEQkM7BTWf9nuR/YAUMiJw2y4ysN1PwUdf17J0AoY/qVR1Wtj/bEvde1jEQ
	CiPIU2JGmZcZu4jVDUz1vIaLfQhvs8B7KCyLtwZYB+xfCa75aUR5pw6YWNazBmD57cPDgBXvNS0
	dcjwdTZDcLtTvFkV9Fhd+N3lhhsh0LuCyg2s8Zj1kr548WYpPgmu7KA4XnvPgwrV0I/BUEp40Fu
	UgWd5GJaVd0YXt1rNGCMc6Bcwglb+mQj68vKTk64WVwDMlez37jngaNkurtVH2aw1joUjlfcgsW
	IznnALrcUuu6aHF241/OrvuBgtttlPxUWwnSe7zf3gS+9Ua/x/9t0OYGD/jmpVQxuW1pjxzkKlG
	RE5cDycPMD93K8XfNukGxtvT9lpUgrcKulg3MiZFxSFXDIuZZdH3VAaaoDwpJDo7rCo7rR7HqIy
	sHqeRItwbBdcea7pk9V4w0tQzvLrnU1QuBkOIAQGb5tt3rj1FBcm97weYVyXKTMj0m7srez9J
X-Received: by 2002:a05:7300:8a9f:b0:36b:d3dd:2e9d with SMTP id 5a478bee46e88-38570354704mr533022eec.19.1795123197154;
        Thu, 19 Nov 2026 13:19:57 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm1466197eec.29.2026.11.19.13.19.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:19:56 -0800 (PST)
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
	pabeni@redhat.com
Subject: [PATCH net v2 4/4] ptp: ocp: correct the DCF output frequency
Date: Thu, 19 Nov 2026 13:19:55 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-4-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
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

The output selector table uses 77000 Hz for DCF, whereas the input table
and the DPLL supported frequency list use 77500 Hz. A request for the
advertised DCF77 frequency consequently fails on an output, and reading
that output reports a frequency outside its advertised set.

Use 77500 Hz for the DCF output selector as well.

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
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 06d05fac6e..0d3d9ffd1f 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1375,7 +1375,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
