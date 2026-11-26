Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711332;
	b=NUjTXxefGYngpVfi/v2z0f8AnvMUQcbz89/dxnSjd1ZQHSYcFwwAlE9HSVxz1rFdGqs+
	 V0SEOHjZzr01e36m8NA447nfWjhSwSw1gPOmdBLIFZm5+dT36Zcs9waLRyXgkVXfBdxYn
	 YO5dPSPrEgZo2QQkxB1tc7UFVXPXmybKjcdTJ5mO+RwJOGPLN9y4aaG+K32sBXamglmZA
	 wFj9lHBLSeVMc0oIwvAOZp310/HVbW/Br0TzNcer5jQAuwFDS9xvig1bfDy1zxofHryOK
	 ArUaZv6RwXFZ0IdouYzPCU7MX787LLd42I/SZe/Xgd9cAvDCeAZ/EbYBYd92uArPbPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=0SFwWsGiZKpcFIvDxjRNjibN9AJpRHuzGw1nmpgwE7E=;
	b=VHanxb7UyuHNkvmoM0kdRZIIJJUd4MEmG5s7UwrMNy1tLMOb8L5CtOQaaRVMWL7HWiSX
	 M8hAOmNSb3bH54b9ZzmXoz21Q2FXhckqgKNbcy0jYQkpLhymeITGDqo3UtPWWFpKXBpem
	 m2wbDEzrLeFqfqrhwE19BEW5T+sAlfegGFfIeIQUM2Q8FhXNFfK5tClIHyn2VoReefs5k
	 qYZ8g3RZvBmjMlqYZF3URlvftAuhtzXCWwj/n/ZsiDgdluVoPp5CfmW/rfYAvUW7G5Foz
	 jBL02lqApW/atYbLzQeYUC79C21Udv1DgFI3/e4g42VJAQL9bHD0BQJLEqYLOEP/MiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twxqx1T3;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCE9606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCE9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Twxqx1T3
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869f03af6aso6334152eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711332; x=1796316132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SFwWsGiZKpcFIvDxjRNjibN9AJpRHuzGw1nmpgwE7E=;
        b=Twxqx1T3QyB77vh2Xe50mVlXXEkIgcbKw/MfEGmsfKUotd3WIvIR5k4NkmL+dmXDYO
         yPWGawjLWciM5kl/7eC3+Q+rz+lIqPnMeE/NX8S4GlQJRwFDQ6RcahGBlQ25SZmY6LRO
         XukW++Ufdy1YkbdqXIg+z8e6qc9VmzF+jf7IuBbbse84kfh6ly7HqFGBL1QVUX+extUH
         TgK3YhHINor9vYnz0BfAarDsc0KmizPe07pLoTulK9mPkO3LTaWQ8uqxTMVLfQssnCsD
         NRFlPni7fKjdnHlJKQZkyJqN69eFd1UAs0cT17BaKJrzW1FuSp1Ldy3hmoGPhJpvgI6D
         dDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711332; x=1796316132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SFwWsGiZKpcFIvDxjRNjibN9AJpRHuzGw1nmpgwE7E=;
        b=rIlcsN2iq6B1Kmyydud+XEoGWWwN4LtXQ5XiENO449nYOjnqxzgen0DYzZcF+JTOD5
         e/fRTBeRZlSwyUFpLwRHxjLSRpcFsw8yMNRzG1pUE5IYwoMDDNijLs7KXB8mPWcCIp+L
         pCAvGS6Iu+/waMOg0enwi8W59HVKt0ckfP1kKv3Mpfv4HXAG5QIeixU+C7an1DqUO0L7
         fWvoqCBVla84S8kc38yKVnPbZ3+ocCRWAOfqVcpyzULOSyMijE4O6lG89k035VwuzTlY
         HT34aJlxnhsjr0t30eEfyTceAuAtA0WR7Xd+YEMMYW0PxBwpt+19zTS1m4x5FAsJa27R
         aAmw==
X-Gm-Message-State: APuU4Z8bKRaL+bc4AaP1Flk394V5XSgFwWRJscIm7ads/UB9iHLwge8+
	ZiYtprzeDQEepkLyiYYXzPUeXGnLk6eQ5hjdPiQtrzoodqPPNdmxoSH48pWm+nzu
X-Gm-Gg: AZFdTZfb0jw6FDkgxzs1Ow0ZzlM9hiOoni9UpB1wIPXral4383A7Yt56Jl9xrUmOU7c
	F5gvLGUFLW1n03151eqJCUrbhkNbBKP1+rCEe98UUg8XYPptCT2iY98n0GVKOTv7grgGqbENlWU
	PdhWlUROur34t5Lb+XQS3jXUpLS/ZcapzKiVzMIw5OXx5hS8ET7U1R5pManojUsetV1k0GY4QA9
	oh14dXJDsilyqigwnfDKQ5O0UVIOIyfV82A4qVAtZrIVf+QQ6TYTPfZYYK6x7j2DKi3F9qPsmYb
	dCSbZz6MaN1E5aunNd6m3NRivBzxBtOSn4GVBZbtZUgqhHeLsiyKYq2ffNQKQ3OkjIeQ+T5+EAG
	vsOcTKoD1HsfG6OsFkkzBWFHhLVohC9xDE5VMbfyAOkmHt7T0anEHCBM7meymoZ4q92XxI40AuU
	3YEidJzEabJV6t257FjvgZBOFnnnu6rLQWyV+KkgIXI1SW4wpqy1DhVIg5Zb0kLpjpcJe2i+cNZ
	37HedwYf9a8e4e2TNWEuSUyaTEdNn4pfniB9fVbgvgE6kLxzmrY2m1D+a4UDX9hXqvZrNqfuFzt
	q1GsnS1wiLArftKBR/PGVhK05BbaBMDviLsAjpKzO9MbfW5rx5vU1Tz2xBHnKQJdTgOZ8uuTfzF
	ijAmnES53q9T5pkZXtV/HslS55/XrVwGbNzvySMm4c1Htx7OxZkR5levYt1CRFL8UON/IarZb
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr24317744eec.25.1795711331465;
        Thu, 26 Nov 2026 08:42:11 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:10 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 0/8] ptp: fix OCP routes and SJA1105 pin direction
Date: Thu, 26 Nov 2026 08:42:01 -0800
Message-ID: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

This driver series contains the SJA1105 pin-direction fixes and OCP SMA/DPLL
corrections. It is separate from the PTP core series as requested in review.
The PTP core v6 series is a prerequisite; apply this series only after those
core changes. This series contains no ptp_chardev.c or ptp_sysfs.c changes.

Prerequisite PTP core series:
https://lore.kernel.org/r/20261126-timecard-core-v6-0-ahmadexp@gmail.com/

The teardown follow-up removes ptp_ocp's early timestamp-disable loop so the
new core unregister cleanup disables channels after user operations drain.
The existing shared-PPS map shortcut is unchanged. The DCF correction is
unchanged and retains Vadim's Reviewed-by tag; tags were not carried onto
patches changed in this revision.

Validation: strict x86_64 object build for the PTP core, OCP driver and
SJA1105 PTP object with W=1 KCFLAGS=-Werror; source-derived teardown and
sysfs/ioctl race tests; SMA routing, DPLL get/set and ART capability tests;
runtime mutations reject missing sysfs locks. Hardware register and IRQ
operations were stubbed. No physical card or switch was tested.

A coding assistant helped identify the issues, develop the fixes and
regression tests, and prepare changelog text.

Ahmad Byagowi (8):
  net: dsa: sja1105: keep pin function on EXTTS disable
  net: dsa: sja1105: keep pin function on PEROUT disable
  ptp: ocp: preserve timestamp routes on DPLL frequency changes
  ptp: ocp: restore disabled SMA inputs when binding
  ptp: ocp: report disabled SMA inputs as zero Hz
  ptp: ocp: correct the DCF output frequency
  ptp: ocp: match ART DPLL frequencies to selectors
  ptp: ocp: defer timestamp shutdown to clock unregister

 drivers/net/dsa/sja1105/sja1105_ptp.c | 16 ++++--
 drivers/ptp/ptp_ocp.c                 | 83 ++++++++++++++++++++-------
 2 files changed, 71 insertions(+), 28 deletions(-)


base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
prerequisite-patch-id: 6bad78c955ada1724510b31a0276a3208ce76a5c
prerequisite-patch-id: dc638755165b24f907f718a498e20d4aa1c6190a
-- 
2.54.0 (Apple Git-157)

