Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399055;
	b=idW7O1ZJ9lijLywx3u8Unkl77ShpF4SBgD8JJ1wIYzMWowzxiUm5M2t54hJEkRaUYM4y
	 8jXcZ6zWHeflUJv2SDExoppcD5i6EOlIW9kO7slQ9gUxLsTJzNEyqZ/1CWPIgztXg5cLL
	 CjxZxzD3uPAC4cwaVwepITs3vivxDynag0iSupFJetgrUphomA8ZJZoWURO4olHiZeTmA
	 Jy3Dv73ipy9odaIFG9XGBhnlE//D5Bt6UysqMQu3tr/Q+CsEzp7sD4u2HS2bEoRD8yMIM
	 7hxVA6PGgN1P0jtLa2Xu3CiZkCG37liyphqxhXW3b/PUUkB99R/5HjUAMzLCmJ0/lBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=33MdLOgkY8inypYgCND5z5x006xVpX0YLRqyjObgHcg=;
	b=YsSJViMwFkNpjILYVOLjykLTseRRDUvV64mU4d3VZJGFLiqUGfF9BsqtYPTA2qI8qctl
	 VAoyZr3iyXN2Ok7VbJKMEhAEHRklQb2JqvR0lMCNQcmrFJFnea9Q5HeC11I8VP11XXxJq
	 XtYfoIsPLb2rd5Hj1K7oYalAgVHLX6OtxWkjiFOsTLpiQU4+Zd1PO/h/tmwCzLlLbv9t+
	 MByhQ5zrXtKt2rtcYsKuR/bKa/y5ZQbQMqxH/LhDvw3z/sOhqkzQu/sFwgH1MSX3dY0B4
	 e+bvdOHunevZxSO4OKyhGGNQCholh3KGpqJUkd6PUY/iJyKNwHWvsDhpgHir7EkgbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTmjUGmF;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300F606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A300F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTmjUGmF
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so7838654eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399054; x=1796003854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33MdLOgkY8inypYgCND5z5x006xVpX0YLRqyjObgHcg=;
        b=YTmjUGmFfLySzF+BzI443PlOFVLQ/6znvsQGdjwd0D/UKH/wo7nv+UhJFeprBF1QUE
         MjGXT1tf+tmVPL2SfV4rOvm2zXZtka4mwbV/9sWT3sUbp9zxOnXxj1TNBq4kRXGfvmlj
         31+jEkNML0oGfOde/5/pz2koAZdC8xcFFiikFUEZ99jYcgF/Cw3js9mowUPsa1O23bfw
         4crQnVKK4cafmMNbcoVqL5vNAdv6Lhqfbnr+vuh7dPA8mKV8qgO7ZJ1yYMXQ5Q5ORJab
         xRA+zjiJYAvc1zYTGFjMwfwtNLlK1JVKm+iOxQst8qQlLtQoeKkpRYpIxzIX9vYHKHE2
         GoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399054; x=1796003854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33MdLOgkY8inypYgCND5z5x006xVpX0YLRqyjObgHcg=;
        b=2O2SNPJQDVsXCn9TKRC8WqmN1ynToPDq2LEStuRjrnd1JgbqFhQAedwoeC/LPgG6Po
         cYyoWXOITigqaw6S7h5lMhvGjWHh4n8QLHwqDwwEm0j3O5GfrF1Mhj5bKhql2mbX9QCu
         on6TE0RlAX6/TV7R9bgcCvo8rSL9hCBBglLJ4vzZrX5V8D/RTKTaUv0Gtbp67VLIzCXt
         4am40GckP0TnM5/KS+wQrQMb6NOoM5ubKkd7opXVhLV8GYKGwZF63nXMbrjluXPEinx4
         ivnuWD2gp21od7isd3eFKVNZkkN6PGMVwFYpTZWiT4Pn2uYQWbSSpAWICSeRBv9Yh4It
         sLBA==
X-Gm-Message-State: APuU4Z8SlNROmL8vAaQ2Gu6uzWzutUZ0LNyhDLfnEoq0Tgn3wKNwWNc3
	wk/BOsRFfIUNpQhIJVeUDiPsv8BIzZlhIoWYbom1Y3jRN3w21eFGgSmBAJHJG5As
X-Gm-Gg: AZFdTZfwq9MXNBZHePL6V7AEAlBqnYKQxtWcDboQQPKfB60MNxxB6eH2CeFsIEmkhLc
	gzw0OewIAdTdSYdps4mVrKSilEKlwtwG1wu5WW7egOCRRjMd99vO9t1nIayYNdFpbSC8bjM00Cq
	cA9fZgU42QHAY4R045otfEkUD+QQjm+cRgH3frcyKD4++zsZLX0sLCPJrG0XUItBZlGLMSGoopb
	nQ794646hjo+wWrCxyFMJDpolF51Gn4AST8MX8Eiyil3VQXgYWXoV3EXlxpMN5imp/voD9TqxQA
	I1mENfLTTlgX5TzhyeyAHDfgDm00fcvOYyRgOyYxllOqYnzMNeOROhd3GVb4ryh/oBpZ/vwdjWW
	FTXiB1ZsEkxd2tSh7DcUkgrn9vpgY6pDuZEIJFIoMYkWotISAqTbKJkLjGCT2loQLBtdDbJzwQv
	ND4M7d43tpus4+Oh3CExRirbpk5cGMFn/7DslLnKo3nWV2Dta3nY+4p1NKcbvi/MnGU25yot8uz
	zKkLS8xo5wzcx/8kPjlSdJZ4zzhaXZlgNqupW5VbGRQAamcyZhkUlAkz4xaTYgXeh+57hLG2ViA
	X8wM6MyEOGUn9BrYm6L9czMUMrh5HsuKyOInUCRvMsPDcvCBMDBfE12ehpkTEk4DLDE3ZSLP/d/
	PBHMY1fi8Z7VJaB1htjuH4j743/fJ+5byIzBXlnxl+o64J4B62fD1lXYdakQWUC/hiRPAqIjL
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr11857869eec.29.1795399053689;
        Sun, 22 Nov 2026 17:57:33 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm34912512eec.26.2026.11.22.17.57.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:33 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v4 0/5] Fix PTP teardown and Time Card DPLL operations
Date: Sun, 22 Nov 2026 17:57:30 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
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

This series fixes timestamp teardown and existing ptp_ocp DPLL behavior.
It contains no WiWi board support and targets net.

Changes since v3:
 - Follow Vadim's channel/pin distinction explicitly: send
   PTP_CLK_REQ_EXTTS disable requests for timestamp channels directly,
   without using ptp_disable_pinfunc(). Keep that helper for actual pin
   configuration. Preserve cleanup after user-interface removal, shared
   PPS handling, and final IRQ draining without a new driver lock.
 - Handle combined input destinations in the DPLL frequency getter.
   Report a known frequency only when the frequency-bearing destinations
   agree; report zero for unconstrained, conflicting or unknown routes.
   Output selectors still require an exact match.
 - Recover disconnected SMA state from mux enable bits at initialization.
   Neither buffer enabled is represented as IN: None, since hardware does
   not retain a direction for that state. Do not write the mux or change
   fixed-direction firmware behavior. Explain the ADVA X1 failure too.
 - Add a separate fifth patch for the ART 10 MHz input table typo.
 - Keep patch-specific explanations and brief validation statements in
   the changelogs; move detailed testing/revision notes below the separator.
   Keep the trailer blocks contiguous.

Patch 4's DCF correction is unchanged and retains Vadim's Reviewed-by.
Patches 2 and 3 changed substantially, so their earlier review tags are
not carried forward. They need fresh review.

Validation:
 - Reproduced combined-input, ART-frequency and rebind failures against
   the previous candidate using source-derived ASan/UBSan tests.
 - Repeated teardown/shared-PPS tests 100 times; checked all six channels,
   unassigned/zero pins, concurrent requests and active IRQ draining.
 - Tested 4,669 input masks and 243 four-connector rebind configurations,
   plus actual DPLL core get-before-set and supported-frequency checks.
 - Rejected 16 deliberate regressions with runtime assertions.
 - Built the PTP subtree for x86_64/i386, allmodconfig and allyesconfig,
   with W=1 KCFLAGS=-Werror.
 - Ran five PTP cleanup KUnit cases using real core register/unregister
   in QEMU with KASAN and lockdep. No physical-card test is claimed.

This replaces the previous four-patch common-driver series. The separate
WiWi support series will follow for net-next after these fixes are in.

Previous series:
https://lore.kernel.org/r/20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com
Review prompting the explicit timestamp requests:
https://lore.kernel.org/r/08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev
Additional DPLL, rebind and ART reports:
https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
https://lore.kernel.org/r/179538006912.3135.16971430532149423594@kernel.org
https://lore.kernel.org/r/179538007070.3135.8275620503580456948@kernel.org

As required by generated-content.rst, Codex assisted with the code, tests
and changelogs in response to review. This does not replace personal DCO
certification or hardware validation.

Ahmad Byagowi (5):
  ptp: disable all timestamp channels after removing the user interfaces
  ptp: ocp: handle hardware selectors and combined DPLL input routes
  ptp: ocp: preserve disabled SMA inputs across driver rebind
  ptp: ocp: correct the DCF output frequency
  ptp: ocp: correct the ART 10 MHz input frequency

 drivers/ptp/ptp_chardev.c | 14 ++++++----
 drivers/ptp/ptp_ocp.c     | 58 ++++++++++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 24 deletions(-)


base-commit: af6737b9066832a2017c281159950ba92385ce00
