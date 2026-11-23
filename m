Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399086;
	b=OtQtp97zGmGvW7a3mFw8w8tisfFAxmhlcYPVU48KIhld3zs7w3GWcYmgi1VITCZQraSv
	 BgSmsSSlTi/FH7il4OQbvsU8rJYrA6MCzBAWJp2ksZy7k38eqiJwLjbVzDcphmpX1Lt0D
	 39VICemoZbBTO1VhQwKytKgwzsyiPUFcPiyraZ1TDjH1ZOmRNtg9jCCckTW794zjD6o/D
	 5Lhpg2t+MoqWaE4pqQ5Ct/NP1LxdSSx6j48yFnHYyJ/0p0wiJl+btLuhKrOuEPDlf2j+v
	 GVrjloILQk5KJSVd66ZVYcWIqRBhFvBWxuGbM6yKdWyvhA1k53XMtQEgrOPs0f/snXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EdnKInqQ5+7MRIlJYl9W6jX0PjWwvTvel1A9zS73Wds=;
	b=MQywFYHhBAXg3tXanrlHR/XbUMqIwBleCUzI8J0vfaNEyn3grldG1GU5m/RYlvCyVuGP
	 inLs4vygXkGKL5ODTGBEjAblzOTmXnaojZYVr6qNUMfvU0wk66xGo1NVtTjCexDo4Yo8A
	 Zxa3clNNo06kol1y/d1nEIWPcdbFitsuzzvVw5l+Uw5htNeko6pWpEy+sqG/feUx8fZ8/
	 CY02E9pfoI+wfZmvrEIxfPnFZXbvI4lONmTBi4vvpcDJTICUTS+QBb1AyMBBWtFhDf5Ir
	 vrnnzVerFl/QehzQ3vvW10OOhhc6QCCwoZ4+e8TuvqaipxKRKOL6Lz2VX32FgqpLnOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz+RRvak;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC4606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz+RRvak
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3863db981d4so3624029eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399085; x=1796003885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdnKInqQ5+7MRIlJYl9W6jX0PjWwvTvel1A9zS73Wds=;
        b=Wz+RRvakizev69iTG+bY7/74flDuBNjlVOT/+y6FX/tZxHy/l/uCfoNxRnWOiJDvpI
         zEB0RihQvjw/wtRoDyqgJ3VbwVKS81LhayPczzhlq0GsQ5GkLJj5e5UO5oN6o7Aui97i
         GnHZAk6ihp8JQWDVj7GQLHxppffCN8dc1rwhLZQUI51CWXVT3g/il923TXgMwnqEx49H
         cE2Mir9UB+K7bXPumWL6TEyCSZdIoYhWUL557cA++VgpTrpD+ND3+UC3qIjgs0ysEbfM
         v56Kgv7pNDZqWddcQeHd7WRTCc4PzTrkzLAfByceaeuZBSjgmSkjcVIlrQxffAyIfFiJ
         bIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399085; x=1796003885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdnKInqQ5+7MRIlJYl9W6jX0PjWwvTvel1A9zS73Wds=;
        b=jJ9pcy4EqDNq1FkNDgKrTkdGlHr+r24ckCG3J7UnJES/XjuFlOjDmhFzVYezXl/dpP
         wJ9ajWV9aJTDddIZ69bebvwuDff+m10TQhwS8q0LnShI79gvKawDIvhcNHlXj66rc4yy
         qZZpcTXCYOv4xBPZzNoD8M8l4hPh97yZOl9pxJ2Ie+qCYCjPtjmcoUuBvrV08jk8FX04
         VPfENh2GWTmCjsiDBDUsQ/PYsHvBlp7FjTAQ4gBVmiBAhmmAgGkUmaVg5G6VcJ1ox0aQ
         oaxv8zH5gcUnqgHZ70FTeaJ1etD7ONtoewZCiWRHWGH9Z+uXgEQiPs/YM9G+u9op8PPe
         ZpSA==
X-Gm-Message-State: APuU4Z+HeskLWcsyUBJnUS9V9VdfB9SEjdRJxMLC3+TU3OQsE6aP6VCP
	9vnNyRMHoWsb7UnTdikWw8P+e91kYJJA77ujZ033DPnQSmND5K+irl9e
X-Gm-Gg: AZFdTZdtLORmKmQ7o78JFjwrRvuU5Sh8s0xTVTY0MhFowTSst+p5Uww9cQC8AziNrio
	I8rQVWNjEROVKcbIjO5mJ7X+W0xvoKfTB6pEtVWp8rG+5ht5BDsxh3vr1BwuSawAGXjlPKSgmuI
	9+aKNn2rqIpRfqocvYLcxy3kKzAdTMe57C5WlHVgpJjRJ+1aJ5P5CvMYCr07XQUfz5NKz2MB2H/
	9owGA4vkPtIPHG84/KIlAj2cXBz1Pz3kx/neMTdZJJXZPpwEvbt/oYQpESOfmSYQbMQ53AR9fFk
	gS79VFp5f5+xNQswN1JfTkAY3ak00lmxsHQ8zgrpVhe1eDojrWiKzsVJSQPUfhRvn9P1UyLAiON
	7oMNNREiXB5nphlZpNmmBiVlXs+KB8BPY9oO8HJcZW2riSyvNzWOTDQxKiuLvusQdbF2ZKG/A8j
	70GfXCCi7BVNeQ5PQwj0FI3Zw0M7NOz7aFBonVfOsgD4emHjOzyist/idor9om43bixjIPdAk/2
	9nWjyKNNokWLxmhP4ZzmL1q1/BAK1eFOZ4ymPGykZev7YzWi0EScO8AGj0IArL4KP7aTwZFYRqs
	acAjQzjh4FSxkGC15e+CnUVQ/s+1njeGFjVmind8ztLHehAZco8WcuHNSGXXaPJn9Vn9RuWNWFG
	h0ULSbzQM8qDHAg0RTg+p4m2A4CAKE3anh6D+qMu2wCxaLDt6DcLYryEYM75U8ztPrOmBQojx
X-Received: by 2002:a05:693c:88c4:20b0:386:b070:6f16 with SMTP id 5a478bee46e88-386b0707080mr1653623eec.21.1795399085419;
        Sun, 22 Nov 2026 17:58:05 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm29522134eec.17.2026.11.22.17.58.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:58:04 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net 4/4] ptp: ocp: correct the DCF output frequency
Date: Sun, 22 Nov 2026 17:58:02 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r4-ahmadexp@gmail.com>
In-Reply-To: <179538007070.3135.8275620503580456948@kernel.org>
References: <20261118-timecard-common-301f823ddd-4-ahmadexp@gmail.com> <179538007070.3135.8275620503580456948@kernel.org>
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

On Sun, 22 Nov 2026 at 20:41:10 +0000, netdev-bot+sashiko@kernel.org wrote:
> Should the ART input table get the same kind of fix? Commit 09eeb3aecc6c,
> the one in the Fixes: tag, also added this entry to ptp_ocp_art_sma_in[]:
>
> drivers/ptp/ptp_ocp.c:
> static const struct ocp_selector ptp_ocp_art_sma_in[] = {
> 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
> 	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
> 	{ }
> };
>
> The entry is named "10Mhz" but has a frequency of 1 MHz. The "10Mhz"
> entry in ptp_ocp_art_sma_out[] uses 10000000.

Yes. The v4 series adds a separate fifth patch correcting that
ART input entry to 10000000. Keeping it separate preserves the narrow
DCF correction and its existing review tag.

> On get, ptp_ocp_dpll_frequency_get() reports 1000000 for an ART input
> that selects 0x08. That value is not in the pin's advertised set. Fixed
> pins hit this too, because sma[0].default_fcn is 0x08 ("IN: 10Mhz").
>
> Would it make sense to change that entry to 10000000 in this patch, or
> in a follow-up?

The new regression uses actual ART init/set/get functions and the DPLL
core's supported-frequency and get-before-set functions. It checks a
literal 10000000 Hz request, rejects 1000000, and verifies the fixed 0x08
default. The old source fails; the corrected source passes. These tests
use stubbed hardware operations, not an ART card.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad
