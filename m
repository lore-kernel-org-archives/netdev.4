Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471138;
	b=PctbnIdPa/WddiCZca1dvWUwqlhZop/OUR2opZPgJDi36cCOYQmC9DaNGdWUrW1wurA9
	 JrOg6SfmJbKjuM0QpsbhcEhqf4baIlyCJQBb5VwNk61KuUoBfuWJfvsEV9BkJYLRhbk4z
	 5y4PG6wlY/Rn81tyfeGDInZg8RKLeQiwBZPx6iYhflLJQbq8RQeASyf3s9gzGZ8OFz9WF
	 Asp6lSzRJ3A2brSD9qiDV27yXMPYw3CY89aIxJSpoGBchJ3L//J+ys9YDqei1wy4lhxFP
	 ajUStk8fkxxXkTwCgjGjEmxsgzfnxxhW/3Mwi1ck5ZNjIugpv5NtMbQESnNU8i4dJsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DV9yKzignK8HrwTMEbGEbZ0KghQpPXelP3Qat87gORM=;
	b=4HuVTohkZ+AiXUFPFw+A34g/Pvp0e0P2AuC86Vjbk+THKeyOj08aLZQj4YJdKbgtwu4u
	 EYS1FcMpCxvV1oMCiHDV+s7mjMfklj8gEWeeHiuUtJ7dHvkwynesvmh0gH8HYVyYG0S6S
	 SbgWCPvLTTIOQmkAiSMXsjTf/gfiJ8Kk8TImoq8o7IZUrlmI+rHVYB3KD0S9L7+lOjwZ6
	 MseOzmUKRhZAKgRUa5AmQ+AJMBNB5q55MixlADqlnBjAhZTElDk4hR5aI4LwLhVDkN4oL
	 WVU1YafOiG9fEDnKUNcygV+tAEQiVvtDdmgD3Jv8VlHBPPJJo62d8j91z/nqUnRA/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgDuQE8y;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C5606A326
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgDuQE8y
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so688999eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471137; x=1796075937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DV9yKzignK8HrwTMEbGEbZ0KghQpPXelP3Qat87gORM=;
        b=WgDuQE8y/o1A69jb5YvYN0KY3iiB7eA9MDq2I1XX5YCoe46tux7MzpMrKiXclX1CRX
         5kVjAcdqoN3JmlrtNbvtLG0bSyuTtZRQKgNWeO0tvi0u2KbBU1BlR/td6IVtD5xn/evf
         DrI0U/yxWHdR+17WVfTODJTm4wFQxix1bd5vmUpVtnJqpZ+yjoGj6RmusesiE6ysDNMy
         ZLze/QHBJjN1ikLTdMQWv21e6B8Ib3dmpXVhVHrUto9ppxhBshj6ZxAVqeS5LlxzyUO0
         LV0E8gxYoqCdvYw5sjatTaL+5qYwbPQWcuXLSRfAuZFGkpMDwbXY7X7w8oanZVqWDzRw
         5nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471137; x=1796075937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DV9yKzignK8HrwTMEbGEbZ0KghQpPXelP3Qat87gORM=;
        b=CGHySkeSPqprZUKhdQl5a8idb1TKC1RY6fNDf8R0Xcc10QLN7gTiNzpLPHtyBBlgkd
         hxbejYnO9Je99/m7SRr4wSXQD6iqx7YXO+OLT+cZPk07Wrix/jf4Z8qXNsRzXA5a88Tb
         C3UFopR0oXnQRZqFQwb3R6u9ZtqvqpxmhmogKzHMry6jkCXyn42x/pkB69VW2iHcbaA9
         CCcpBw8Q/dM2xJY+LwVZtSQVRrq9r0odLFdc7WnavunORKsEP6qpUEaEihkMjr6UbEKN
         cmYLIUyXyvIW9Z1++zzTWGQGdM/zok4NqgGozLuVleR+zHa1pPC/nsVu8YYDGlKqHZLZ
         KW7Q==
X-Gm-Message-State: APuU4Z+EkPzio/qo2RjCnxdwKj3ppmn8fybM7xET6CVwnQpY6D34tv3v
	s2Dfytq4s4FibT+mUIAMKZhioZXbUsG0k122IKioVaMuJg3bt0Av3+yh
X-Gm-Gg: AZFdTZf++MW4c0lZ3//Qa7NCDDfJ6dMIZmvwH6wJT5+EGUPcfxsQ3G/6DozhrYFeeYx
	Io/b/K9qTpeqMTRFgP4ie0qXS3EcgvGIwftf1GCcEib59KZbLfmr4qVqaC2AiESrsZVrzzwmRuS
	PQiRu/DBbWnSNVNu1loeJuA7J+ki2yR3N87Osy3qlL26FvSywKeaiDMsG8S6wbHS7Hub5/mNsCI
	kkFFFuVfsJM89P+ausPmHQpD5iZcKJRahMJsb7UTNJYB++CJ5xa/4TJAFqTCGmXMcG5Pv+1gEM0
	WAtQrwekyW76t8koBxnmaTldJsiWooeMfy+gXM3c6ey28WVo6Wa5ON4jwcA32hdx9j0mBIxUEZp
	z5+4sMLK9hQ/TCasUAx1qzUL/4+ry1q9+6pfCF6azwknPb+OYVcDj9ZdX9z75vgl1n2XDhUfR6P
	9/qJNQQi3ewwPkjopdJ3zjU/YEs8x8Hiah/UiHfSDun7DXGp9WfIE79wXrh26gU+PedldbjDKxF
	p7ZrcWwCzzhc3LtJEt2udZHCOdXmpMiuMefBAsZti3NN5O9v17dXaQ3rjAMzqQqs6JTXwMOArOz
	S4dF0MD0iQKrwLORM1f1jV+r07PY8dSpVcrbqOfSeCeEZie5EPxmz2CsvALxdwmG9YQL0Mr3cNZ
	Ab5QzOWVnijgiYLQRmzhpmkFK+7QIdnRP4sXu/9O5p/bCFDE9Mw==
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr10983073eec.2.1795471137447;
        Mon, 23 Nov 2026 13:58:57 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm38247176eec.23.2026.11.23.13.58.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 13:58:56 -0800 (PST)
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
	pabeni@redhat.com
Subject: Re: [PATCH net v2 4/4] ptp: ocp: correct the DCF output frequency
Date: Mon, 23 Nov 2026 13:58:55 -0800
Message-ID: <20261123-timecard-common-v4-followup-art-ahmadexp@gmail.com>
In-Reply-To: <179547059147.3135.16821426799248727782@kernel.org>
References: <20261119-timecard-common-v2-078fe69f33-4-ahmadexp@gmail.com> <179547059147.3135.16821426799248727782@kernel.org>
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

On Mon, 23 Nov 2026 at 21:49:51 +0000, netdev-bot+sashiko@kernel.org wrote:
> Should the "10Mhz" entry in ptp_ocp_art_sma_in be fixed the same way?
> It comes from the same commit, 09eeb3aecc6c, and looks like the same
> kind of typo:
>
> drivers/ptp/ptp_ocp.c:
> static const struct ocp_selector ptp_ocp_art_sma_in[] = {
> 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
> 	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
> 	{ }
> };
>
> That value is 1 MHz. The matching "10Mhz" entry in ptp_ocp_art_sma_out
> uses 10000000, and ptp_ocp_art_sma_init() labels 0x08 as the 10 MHz
> input:
>
> 	bp->sma[0].default_fcn = 0x08;	/* IN: 10Mhz */

Yes, thank you. This is a real defect in v2. The posted v4 series already
includes the separate companion patch 5, with the same Fixes commit:

https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-5-ahmadexp@gmail.com

It changes the ART input entry to 10000000 Hz. Keeping this separate
leaves the DCF correction narrowly scoped and preserves its review tag.

I reran the source-derived ASan/UBSan regression on the unchanged
submitted v4 source. It uses the actual ART init/set/get functions and
the DPLL core supported-frequency and get-before-set functions:

  - A literal 10000000 Hz request succeeds and selects 0x08.
  - A 1000000 Hz request is rejected by core validation.
  - The fixed-pin default 0x08 reads back as 10000000 Hz.

The pre-fix source failed the ART regression during v4 preparation;
the submitted v4 code passes. These tests use stubbed registers, not a
physical ART card or an end-to-end netlink session.

> The diff only changes the DCF .frequency value in ptp_ocp_sma_out. The
> selector, mask, disabled-state and removal ordering work mentioned here
> is not part of this patch. Someone reading this commit by itself, such
> as a stable backporter, will see validation claims for code it does not
> touch.
>
> Could the series-level testing notes and the description of tool
> assistance go in the cover letter or below the '---' separator instead?

Agreed about the cross-patch claims. The posted v4 DCF patch now describes
only the DCF set/readback regression and its software-only validation:

https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-4-ahmadexp@gmail.com

Detailed test and revision notes are below the separator. Brief discovery,
validation and provenance statements remain in the commit message as
required by maintainer-netdev.rst and generated-content.rst. The repeated
selector, disabled-state and teardown testing claims are removed, and
the original report link is retained. No new revision is needed for
either of these v2 findings.

Ahmad
