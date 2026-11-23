Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399079;
	b=sXnibaizIrvFwACrlmEAAR8bc0yDvrZxZODdfuOSE1zbOv6FYKiTWB6vg7D8NsHI9tK+
	 iS2TM4f6flyKoprX2X70nKb2CmHFTyb1CfjBCdOuN6jlHBZigB1YwQu+qTOzHLUkpm8MR
	 hZxyFPhUtM5YNbriWqRQ62hRHoq1683WD/4vawczSSbSRu+dX7aMmNlkU+tWzbPkriyBR
	 jI0QlilldS/Rx6vtjIruF8O4ZOkbmfzlpRPagqfEV3tb/n+8RMw0wLzm0VI2sOTYNn7OH
	 ALiPo0fYXfoMUB/DGL1wa4s0Xi0vWcjnZLNtUy0xgICoxFJ5sLpf5Mbg1Ge2yLQIMug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ezHR48+9BwZ0n/i0dqiHwyr6GStnzWguX/xPKSwudYA=;
	b=X35RqjG8d4WEZYQOnh+l+LwZyU2I20v+oBWbHdlVvbpm+7FU2ql6A1nPepjY1W2+Vj3C
	 4wN9aGYgBYvZlv81I8avKEMpFkuOw/iuloN/VeaQe6M0p/ycnEo35GmNfucPo63mIde9e
	 55p5SRY/fMSMEVYlGbyIFjgHpnyFpVg9v0yHKfAKH4dVteM5DEgo5Nz0/Int97qHV0IAf
	 ZiI8F19JcZd6pJGhlMqvtIljUTB1IeiDGjd7KtyTzB0nD0O+a/rFvvFn4eLY/Uy6jWYZR
	 uIdFdgboiTPO94T2uAuW9Yg7iJZh5Y7pRG47VlDg7JvYfKCVhFqY2F0SVKTMf8/Z84w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVXLSQMA;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B6A606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B6A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVXLSQMA
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38587f3de36so3372330eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399078; x=1796003878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezHR48+9BwZ0n/i0dqiHwyr6GStnzWguX/xPKSwudYA=;
        b=qVXLSQMAZQUdwvLsyxyO5e4h0NaeBfaIJgmL4jY/s5YBmmgDPwPOia5qZV0daN0lLs
         UbNCMhZTJYzpxeZHvPtoOHBwftQqVCELbRhhUoYpzVf8aFFqJ4pR1dWFRppvhgxmYPob
         nLdyQPCf5di6lhai/0GMz3baxRyqz4UXzszm+ZAiKhkD6frX8vzF3y6Ki2iTvNFrhRSF
         z7w7dNfXtLhDpMRVIVVVWYDAvpq2aVbm9a++yicZxg//QiDCaJXyWwZcIkIipj29Ttim
         lhCjiLFBUJd1paCUlTNF3wXyoznMCCjw4K8HKMdqKzQ1WusB6SOc3ZsBqrc2GduH6HbG
         a0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399078; x=1796003878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezHR48+9BwZ0n/i0dqiHwyr6GStnzWguX/xPKSwudYA=;
        b=idaOtR5DW2riRpJbPLygFfnK77ESI9NKqdgDBumgLPy6IwnL/O4Mw0mX1I/+knQG/r
         98Tt1IqnHHyQMYbaJ+wMsMxKu/pGbQnLpY51nJX3E2kLG+aMEo0kcMFl0hd+kF667efA
         BSvl1c6brCq1c+WnQoWcxevyLgUTGKnQy4TesDdEr4uQ5TMJvXutllLQ7pkF8oHuOWTu
         GNEE9Qnqhcui8/EN0YUkXh8KG8BfiF5N02biD2WFOXCjMttHrNMe/RQG1iRx213SFeJC
         g/uFWprq+G0xct/YVKY+gDhT3T3vpC2/m6Pb3+6Wnc/kV76eo6fMXccU3RMcWmmgbEuG
         FLvA==
X-Gm-Message-State: APuU4Z8QtQfU8Pr0D2MXyYAwisLJFeizKyvOWZwqvdTv39YMli7xoD8P
	Ot8lQ8idsrXwSH2rqHJL4t/KGtWfMscRsrUpOK/D1ToMr2RnPsLQKq+6
X-Gm-Gg: AZFdTZeqYEFmp2CxFyLd7J+vZaQGcNqwLqbBMtw+lln8orw/nB61z9zX+slBpdvqQVM
	MHBd+a05LV9wTgLOB/LTvJ6J51blURqTMlLDTso7qIObkDry1Nakp0sIOTdXXyet7p7Y95Tyn/2
	JrV1XSOFVhJtv8YkIXBO+ILiHeTu48zU2zMv4PhsHA2PJUCf3DVpAitScYDwqW42HijrUi3NjIo
	Z7zRen6utBaxXXnLpuCJPo4isicUQcNCCl38aI1GDe82ZXfslWdLMpexZoHfgWdCIPb7bbcE+2g
	R3TrHb0nBZDUK7jxWmqCTFNKqcd1S1+94KzJamPHurHHDAIc0X1aT2ID91Pu7GMp0dq9maAX2lp
	npLPIpMNWVn/36zvDMy/K2YXt25DEQcXthTVa3HFT5rzAxW44xJZgpVVMgRQ9H5gih+ujgnnUMe
	yQZ6Xi3AMBabNfUfLO1ZD43/D33cDGoH4jAUpSqGtiamzGheKwCC5Yb7OcZvnPAtcwsLBlNlrO0
	Lfwb8OMQrWM3Iv3BQUQFPs9O00M0v2b+KMqL3qvFUMcLk3ZYC30Dlud2063vI7BTog8yUfRBeGj
	OwIFeow9IwyW73BbR2NaIq3+TFPlFGCjCKmssk/6k/mFCK1kN91lxmYbsH4zt/pY8wtXOwTiY6+
	QdAK6b4cxR7mk1It4ofZeEF5Okx37Gqxd8PiPMC5rXVex0qARu9sjkYAjHpwKD2ZHKkmaAnMz
X-Received: by 2002:a05:693c:60cd:b0:386:98d9:d5cd with SMTP id 5a478bee46e88-38698d9d928mr8331670eec.39.1795399078400;
        Sun, 22 Nov 2026 17:57:58 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm25649607eec.25.2026.11.22.17.57.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:57 -0800 (PST)
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
Subject: Re: [PATCH net 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Sun, 22 Nov 2026 17:57:55 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r2-ahmadexp@gmail.com>
In-Reply-To: <179538006772.3135.15875996486888374193@kernel.org>
References: <20261118-timecard-common-301f823ddd-2-ahmadexp@gmail.com> <179538006772.3135.15875996486888374193@kernel.org>
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

On Sun, 22 Nov 2026 at 20:41:07 +0000, netdev-bot+sashiko@kernel.org wrote:
> Does this still return -EINVAL for an enabled input that has more than
> one destination?
>
> The commit message says that without the mask "an enabled,
> direction-configurable pin has no matching table entry and its DPLL get
> or dump fails". The sysfs ABI allows several input destinations, and
> sma_parse_inputs() ORs them into one selector:
>
> sma_parse_inputs() {
> 	...
> 	ret |= ptp_ocp_select_val_from_name(tbl[dir], argv[idx]);
>
> For example, writing "IN: TS1 TS2" to smaN gives 0x000C. After
> ptp_ocp_sma_store_val() adds SMA_ENABLE, 0x800C is written to the GPIO
> map.

Yes. I reproduced the error against the previous candidate. Masking the
enable bit alone did not fix combined destinations, and the DPLL core's
get-before-set path could still prevent recovery.

The v4 getter handles input combinations after the exact-match
lookup. Frequency-bearing destinations must agree to produce a known
frequency. Timestamp/counter destinations do not constrain it. A route
with no known frequency, conflicting frequencies or unknown bits returns
zero, as an individual timestamp route already does. This is a routing
interpretation, not a measurement of the input signal. Output selectors
still require an exact match.

The source-derived tests cover 4,669 masks across FB, ADVA and ADVA X1,
including TS1|TS2, timestamp-plus-PPS, conflicting destinations and
unknown bits. Recovery exercises the actual DPLL core get-before-set
function. The previous getter and a variant that chooses the first
conflicting frequency both fail runtime assertions.

> The commit message says passing the index can "fail on ART". Can a
> 10 MHz request on an ART input reach this line?
>
> The ART input table lists the 10Mhz entry at 1 MHz:
>
> static const struct ocp_selector ptp_ocp_art_sma_in[] = {
> 	...
> 	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
>
> ART pins advertise ptp_ocp_sma_freq (1PPS, 10MHz, IRIG-B, DCF77). So
> dpll_pin_freq_set() accepts 10000000 and rejects 1000000.

Agreed. The selector fix was necessary but did not fix that separate
table error. I removed the misleading implication from patch 2 and
added a separate patch 5 changing the ART input frequency to 10000000.
The tests use the actual ART init/set/get functions and DPLL core
validation: 10000000 succeeds, 1000000 is rejected, and the fixed 0x08
default reads as 10000000. The old source fails those assertions.

Both issues are addressed in the v4 draft. Patch 2's expanded
behavior needs fresh review, so its earlier Reviewed-by is not retained.
All testing here is software-only with stubbed hardware operations.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad

pw-bot: cr
