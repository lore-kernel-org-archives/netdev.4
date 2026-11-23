Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399082;
	b=el11r41UXaIEM8r8HJZl2RyqOOMOrcVOATRkKQiNcmmGM2sR30hnKkWxTjHIsQAeRmTd
	 ESgqUXjm/iVyLWn4mwYpDNqa4bKbUlXsRayMcnqpvTrPJnN5bAuGpczIu6rDCcWAuyeaG
	 NUh63dzsfqx09MVNp6s1u2AvaOlLLhTYnH8h2lk3VbDurcX7x893/ATj6wlXvoTpKK/k/
	 Y6nixqIKEaEvln52F82vkIvm5zlFEo0LBpB7khILyj1ufouGeM3MBA+3w6vH6NLdHkcPP
	 X1o03bkOnCsO4WlXl0cooJdru8Oeqcz0ugLV6t68eFMxbnJoro08Sd186gXQxDduodg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ia/LiFOfvdAhK1CwZCpleLXreqssEtbUn/IkgtXbeoE=;
	b=uzFOGMViRIKFX58yyzR5boEy3KeZgjjZZ2R20t6gv9qOaEDcuJ16PG508LDt8Ni0lGUX
	 73q44QeujJHGHR+B/zWRxszjCbaMEInAWt75GOh8BHu4OE+YNNpYGl3sMLBt5oSgen+TI
	 fWjDCgK4jAQE4oe/SeTVZQRGpPAdbrXUSmrBFDyg3vwEwTocKUpJM4o4MkBf/MT9RC+N+
	 wGGIU8hDKgfOIymS8gf8PTLFcZKy77+bM6PKZqad3GTl8BUIgAP2617GWHCiwL481WD3s
	 BPNEc855UlC0w7AKdO52jL6OLBB16umOB0fY1SgGoQoLjZ+vBqrQdSgFry0sz0GKPJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+baH6Ps;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EA0606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71EA0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+baH6Ps
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b546061d58so6329812c88.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399081; x=1796003881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ia/LiFOfvdAhK1CwZCpleLXreqssEtbUn/IkgtXbeoE=;
        b=d+baH6PsXGkuzvWZh9Rqo2B0UstJXaqmSiDJQkpSS3mREGXoc/r1FnaVHROqVCfKqL
         884xWUpBNe1Ssr1pmfoIVyQjM+Pbd3hv/y41GosFfmYUE8qeQSFVYLgKDrYGiVDyD50A
         1JbpRm+NeTws+VpRavbRkpdmxDbi1uJNSEaNdNw71VE938DFbvFy9HGANXSKbFzRiL0i
         PITo1dvXs3QpGyNingx+2R3TgVbnraX82KRCRPsrXmnOwLFObnCg+CLrTqG3KjC7exHH
         m3PM+MRJJPbIwX9KiLeGuhZTgz5UHGoel099fhDvrQJVlUtIKnBiJRAvPgLUglzA9Ehw
         lvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399081; x=1796003881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ia/LiFOfvdAhK1CwZCpleLXreqssEtbUn/IkgtXbeoE=;
        b=WTRBPPcogpK0Rvisc86JBedR5UyzoXcDtJk2XDt4rc9OBbzOdcSSe0NoFXLGgdCh1/
         nZha1ezXhRgkrDhyzu9glEbc7q/MaDGDNPKx2gwhkjGWRFUsqaHSdYmEMSfm9UEtkdfZ
         uA1hbQJXHwxkUXPbMOpVwSzaAaeCqnqeiy2hqIQWDUtOAw2OnKggY4G2H7LXTlB9kreR
         I2wqFquARSAwFa+Tn0Ivvv+LPfztIWLoNMIYBCTjwCBUPGowaXJkfbWcfqh6hb62Qr0w
         +WfT37Kty68tIZ6kVYvT7gaAs5t8DTUbwKl/SnF65O9J0ZXxCOkBl+HniA6Sn6gpN7Ba
         6a/w==
X-Gm-Message-State: APuU4Z8dL1KsH8jIObfe/8PlKyvwRvwCC0uUiD+4wndNBu8FR2VHpdr9
	VCr/1HxdOnp5ZGePjnpMO48fm1W/VczLnhDWl5AX6/o2l+krKK13C0eZ
X-Gm-Gg: AZFdTZdmr63fmoDwwvovgZ6Qco/D7IjZtgXpESvdEXOeUwtdDM86M1w/9WJBaJsUd0k
	jqMaCG5+XI6CXpoRBY96Obv9JgUdBeFkwuuu+omlSmuPvFBbif7wUkh/e1Frk4FyR4awjL7bcAM
	7ivq7wuuqK/BEFRsUfrIATbeJmAB1+WyfB/gBpJGcCXKFuehlBmFpCU8wJotMpGuSpN4P5w4E3y
	l76rIJKtqjmSuvE37Pr+SQ9s5SMFyG7RkM2q2XdWApVjW1vn+lxkXiSzyygEAH7MzSqKkq3LsuV
	U0zLt3bDLtxS+0bmVhaBrreGv2ls69j3uRm3tjDImLNLG7idUBewW6FtbkzSOszcZy36Dz2xfwZ
	/5Er04Fo0Jkb02LFLx5Ff9kEqcKYn6ktiJQKmQSu1yu9R1k9e2ygyKT8LLMCY47eO31rCe6kn/s
	HJ5lVQboaUANwLw5c+e5DQ7eG0qGC6F9HHi+EYj6j4flHYpB60e8fcm3VO/ExNOlFh/VME11/dr
	I/xrbxfk0kaC62I95n/Wsur/vVpC1FHnixoEnl1TcSMkGgdS1QGt2PZEJIW26UXZJ7nx5tRFgyY
	PI2ha4fLNiAh5m2DtGeRbgz6VjZwZILbjV2jbFMyQRI7LGfgbQnnoWjun1Hsmn8k/Y3BBlgsbo9
	Y8eAKmgB8HmHWonOjPw4H2ZX47ZCkqRom8AbdhkLCPUcOP5WGdyJyKus87rzfZN8j6eo9cIbM
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr17131127c88.17.1795399081588;
        Sun, 22 Nov 2026 17:58:01 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm23843898c88.10.2026.11.22.17.58.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:58:01 -0800 (PST)
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
Subject: Re: [PATCH net 3/4] ptp: ocp: report disabled SMA inputs consistently over DPLL
Date: Sun, 22 Nov 2026 17:57:59 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r3-ahmadexp@gmail.com>
In-Reply-To: <179538006912.3135.16971430532149423594@kernel.org>
References: <20261118-timecard-common-301f823ddd-3-ahmadexp@gmail.com> <179538006912.3135.16971430532149423594@kernel.org>
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

On Sun, 22 Nov 2026 at 20:41:09 +0000, netdev-bot+sashiko@kernel.org wrote:
> Can this check give the wrong answer after the driver is unbound and
> rebound, or after a module reload? sma->disabled exists only in software,
> and ptp_ocp_sma_store_val() is the only code that sets it. The FPGA keeps
> the mux values that the previous driver instance wrote.
>
> ptp_ocp_sma_fb_init() reads the mux registers only to work out the
> direction. It never sets sma->disabled:

Yes. I reproduced the stale software state using retained mux values and
a fresh driver instance. The v4 patch initializes disabled state
from the enable bits for direction-configurable FB-style connectors.
The existing direction selection picks an enabled side if either side
is enabled. If that selected side is also disabled, both buffers are
off, and the connector is represented as IN: None. The hardware does not
retain the previous direction in that disconnected state.

Initialization does not write the mux. Fixed-direction firmware, which
does not provide these enable bits, keeps its existing interpretation.
The ART initialization path is also unchanged.

> Would it help to set sma->disabled in ptp_ocp_sma_fb_init() from the
> enable bits, or to test SMA_ENABLE before masking?
>
> All of this assumes the FPGA treats mux 0 without SMA_ENABLE as disabled
> rather than as the 10 MHz selection, which I could not confirm.

The public SMA-selector RTL assigns bit 15 to the input/output enable
signals. The production top level uses those signals to control the
external input/output buffer enables. Thus a zero selector without its
enable bit does not enable the external 10 MHz input buffer.

Pinned sources:
https://github.com/Time-Appliances-Project/Time-Card/blob/1042bd6f9ddb1844c8b471efbf560c96c8e6cecc/FPGA/Open-Source/Ips/SmaSelector/SmaSelector.vhd#L293-L301
https://github.com/Time-Appliances-Project/Time-Card/blob/1042bd6f9ddb1844c8b471efbf560c96c8e6cecc/FPGA/Open-Source/Implementation/Xilinx/TimeCard_Production/Top/TimeCardTop.vhd#L473-L481

The software tests cover 243 configurations across FB/ADVA/ADVA X1 and
all four connectors, including enabled inputs, outputs and disconnected
states. They assert zero initialization writes and unchanged mux data,
then exercise re-enabling through the actual DPLL core get-before-set
function. The previous implementation fails the rebind assertion. This
is source/RTL validation, not a physical-card rebind test.

> This patch fixes that as well, because SMA_DISABLE matches the x1 "None"
> entry. Should the changelog mention this case for stable backporters?

Yes. The changelog now explains that ADVA X1 has no zero selector, so
the original disabled-input failure also blocked DPLL reads and later
frequency changes, rather than merely reporting a false 10 MHz.

> Could the paragraph be cut down to the testing that applies to this
> patch? Someone backporting only this commit could otherwise think it
> covers those other defects too.

Agreed. I removed the repeated cross-patch testing claims, kept the
commit explanation specific to disabled inputs, and placed this patch's
test details below the separator. Since initialization behavior changed,
I have not carried forward the earlier Reviewed-by for this patch.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad
