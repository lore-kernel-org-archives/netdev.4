Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201912;
	b=PO5otCJnp7tA75kVBCmqXDfyzlojvoBL42a1IdOf8i8V6c8pZLjAisLKHrOEJ3AEoSP8
	 ciViOgYW03fELUkxmjU26wLWG9kx2ZlaMfxchXUFuuGboc0x2Nb0UuGKwJYEAn3zjrlSw
	 SUbpIEe+1AmthIQDkGmqpfSOcLwDMb3HucQTBMoJdeMWXA1dowEtCmOk6/ziqBr67htJl
	 mMUE1zZSsm8J1+oaPvAJKK9b1iMcBJpSZarU8KBKBAMYVTbedk2fIIPWmadWG6gJTdoHe
	 YrBcZN8WGaYa3GtytGBDvtBBsBfCWKcIyxukPfHVhcemtXOBHDSarqGmfipZPiocO7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=MfI8h61e3YMKVrq2h3izbDkMZ/iPIC2DcSVnmxWaK38=;
	b=bdc8RytBUT2sR/TJx2poMHy+A2sT874fEMfO3tZa+cFV5WhREwflDz8SROfxjCUGoYTP
	 obat3SJI/td2wwKmyLnaW+xE4nAO0XEH9sEfvrW64fLSX7ANsjK3TeUBCXtsPqfFQ/Ae6
	 0LlxeLDtAFEKpNHEO26Ed1i5J86bto21w2FdLQYE/imutmM3uVMFait2LnCdQsGcGkMs7
	 BQTsu0N4Uom5zJIaLR8GcLnJ+Q5aQP+Mrx/MCYT+an4Ap3cYE3yJ8Po/F0o1S7C17pZjV
	 T+eMAZCP980yzsZK9VIYibU+ZICItBcrLIeJMzkEhWtGwgF5P5pTRo5r1pdjCKyaVUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AS+HWRzV;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFE60A2618
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FFE60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AS+HWRzV
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso932955a91.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201910; x=1795806710; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfI8h61e3YMKVrq2h3izbDkMZ/iPIC2DcSVnmxWaK38=;
        b=AS+HWRzV8TNC+o6UMnpbMf3MO+03DWGnm9XxWLlLJ5oNbpKebzojf0B/x2y0Lj0g9O
         vVxkrLDZz3SYkCkpS84UMY5Ln+nXfIFNl40EyDrREE5Nbir4Uqfq6y27HxdZvwxjil1A
         FS6UkJYPFtlGWPPNjiZDdtTg9gsbz4zvOAQKUzUG0KBAL1B/VMtfO7qY3pO1I0XRcy60
         7PfptsxDfy2IasrDsyObFTMl9LNTLnVGbcqWQOs+pDWB5ppVylqGxbo6Offesuxm2OM/
         BbJ0gu9GWwkchkCT/I1xaNtSLAd7F2oBcPUF30NJomnpcx0FW2aZDNJIhsbN3sNosX55
         FVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201910; x=1795806710;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfI8h61e3YMKVrq2h3izbDkMZ/iPIC2DcSVnmxWaK38=;
        b=BcdUGA3a1o+lWgOgRVJ34rs+XtzIR+tsAUso0VAB4/yNZJByH5omPxyfGyGoV6S6k7
         oycFPomgDN8WWZDbPr/LuhwF/l060Nhno8av1r7Cic9PmtPIClJcG+qRyUUxbukqkcq/
         XHKx1mUFRhvSmAaoh7B/rHulS8yvxFNOa6sM+C7Eii39J3yvDWe7s8rIzcTHYrwd6UNA
         VAsuaa53aGq+OL6rik7ndKH/RcqDJlrNz2DFc7IT6RAd7swVB32/6wHVtYVt/SR9br8+
         p+2MQIRH6IxvhGy/0p2RmPbFWgSCKUR25UrKE+8rwD+uwLxsXVC+h/llqPh03aScxNBt
         6m7Q==
X-Forwarded-Encrypted: i=1; AL+hErFj0Ua2lXYo/WodjC5kKhHmGb7Qk5WWIpa0eN84ruxgMjEPp6OVpLNe5QOhiOu+q0OfNLFpfNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9swQsjHFrRf0svjJrr7vJzkCKxm/qhtBa47fS3KpQXoYImSw0S
	lQLYq4VexwicT9ZaHNhYFVUfz8O94LVvsmQUHs0vV0KBaYHhUZxJd1EK
X-Gm-Gg: AZFdTZeiOI5xR+24Cvy8ukKG4Z3Dv2WhQ19ArMeurc33sN422f0A592H0ioRVzsgd/U
	Vd1xC4kebbLwpdtbrwtBzaoWczJeg+ipgwTyLCVCKBRuZ6FepBM/UfyPGK+zaBfBZE6G1ATfzc5
	B0mMM4W0BpSRZSMGaI7xw+AUkFq+N52u8BPGUVaxIlTpXXkMdNK1n60zanB9/S+rj7DMK7v5wcE
	DhZ4MrLQxCKLFx2RpisF3AYZpG8N+kzxRyQHstYGtXwZCehF3SZnvlNwIeA3B3voC7azwFFu/Re
	o0aTbHLjnsr70xY63UZMWnlG8YE7tkW058qDgfVyUpW9QTdQ25hpj1xVqEyR5JimW23uBBSADIR
	3HiNMU1bgl0iPvwAQZPne7QTS5hSvLcV81VkFA6qTPfLJ/2LbRlLuqT7kXTpibO8h/41vR93/GI
	ZFsNdNF402b1SlNuNyLuFPkKIv+blfUihHxI/hBeg8jMPa8tLwelQeTl4m+UXTZLogcOQOW9oE0
	qq/CRKbwLpsiS2u57sQ2WAjeL09QSmmHp6C1/FyMYlxi6XYBKTMtlJglHie5tmB0EdQKrgAYqxT
	OggAr7UJxnz4FMttP1d+hgmByEwSQiWr4ksTL1hu2hOIH+Pwyc4UEZn0hEx+aNbS9TQokHcnUFB
	tbD6GmkX7MJOKIIZecxdLTqKGLj2v68yFOg==
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr3666281a91.22.1795201909486;
        Fri, 20 Nov 2026 11:11:49 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm8522514a91.10.2026.11.20.11.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:11:49 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:11:48 +0000
Message-Id: <DN09YRKU82D1.1QHV2CIFW2C6H@gmail.com>
Cc: "Steffen Klassert" <steffen.klassert@secunet.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>,
 "Simon Horman" <horms@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Martin KaFai Lau" <martin.lau@kernel.org>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Eyal Birger" <eyal.birger@gmail.com>,
 <ipsec@lists.linux.dev>, <bpf@vger.kernel.org>, <stable@vger.kernel.org>,
 "Jiri Pirko" <jiri@resnulli.us>, "Victor Nogueira" <victor@mojatatu.com>
Subject: Re: [PATCH net] net: xfrm: interface: restore dst_orig on every
 xfrm interface
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev@vger.kernel.org>
In-Reply-To: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
References: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 06:08 AM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> with skb_dst_drop() before the route is installed. The helper allocates a
> metadata dst per skb instead of a per-cpu one, so the route it records
> belongs to that skb and is released with it; the per-cpu allocation is no
> longer used and goes away.

kmalloc per packet should be ok here. xfrm_bundle_create() allocates a dst
per packet already.
It also fixes the route leak, the double put and the if_id mixup
that Hanxiang reported on Oct 29.

Reported-by: Hanxiang Xu <xuhx@hust.edu.cn>
Closes: https://lore.kernel.org/bpf/48129353.1960c.1a1859496bc.Coremail.xuhx@hust.edu.cn/
Acked-by: Alexei Starovoitov <ast@kernel.org>
