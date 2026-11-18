Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794962587;
	b=yR5Lo9h2HPQ3K6OpK3eDHNCGrcyEN0xusDcfct/L3VmQa7eWCI37YXnkd6DnOv7zsL4x
	 rKBaJXuhCajU08ZeowVIUh4lBlo7xkWwC2DJLP4TAa5rsMfbfr80QgjGjSbb3wn4DRoD6
	 yVSRkflmgmPD774yVZ3FE5ZecBQs9z/abzQaxjqp9aoMR8//xepUzNtzxcZG+cSEmCc1A
	 +ipZutFBMfm7oQKpRUekvX3O5A42WOBfUm7a8RfXnA0/cyJZS5TKiFPTTwljt5TX/KRUx
	 3d8FBDhjB5ac9RXi6jufcvByTUOJh4mw+k7Go85+4G31pIsq5YaOToApn7dO2+7iDAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
	b=yHo17nOzJQ8VvGyOSEcK4Yznwoq0OK7jB7YQg+yeQXDFGDsCCvXkbusPMZSwLZE1jEdx
	 y3GujAgEIx/l0IwByEWHId/ZeAlRlzqQgvP8SUK6XMkYH+sfy87E14xSe35NuTfOur1Y9
	 /oJVA4ua6fsuTo7sylMPks3z4DDHKm8ABAQyXLmJvxNYnga+v96cFCSjpFwP1i/Wq/Cnq
	 X18UlYm98wBqHhNh6g0yCa/fyPtEHPUbUHleWQNu5lMVNLcWFmUmQx/cVyn7HKh/a9a/m
	 pYd0FX/HKodyiisaRHI0JukrCCYD/6GIHbp9sSibH+uxr4po82eU7DYRyzcXFGF8TcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QoQgSM7k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53784606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53784606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QoQgSM7k
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4877837890fso213125fac.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794962586; cv=none;
        d=google.com; s=arc-20260327;
        b=Qy2qnhkdg1MBAFLwFTnZiNsnprAcA66X0UGhlBfSvevLirKWZfYJJjbuYLOlbSA/pH
         eLghqVeqP62rgRYwrD4YMUtr08TA1lshFjSMQETqtkCoJeTKrLwlnQ3bKyvyS9g6iGHr
         mjUU+wp5sCUkdynKhM9JXqy7FAF4JwQzOKMNS1z9EPpiM6Vtj8cf0tmBTzN3fY8k6zp4
         9YhOexyroT9P+NBYyLksNUMh/wbCyiY5rGcBDcFDhbt0FAagJYmsKGDFBQ0FZwoo4JdL
         P9QwWfisEvw2ED4i4MbMgIhVHo7flV1aarT/xvvCDgXLOS70UIAUwzZ3KMy2l5jrVFik
         dniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        fh=YjUFszrAjPPbukWbsUgJEnvVcdcxs4bdGFKk1nkfgtM=;
        b=mA1lm+L8XF2h+Pq2YnF6LdDSkt5A/tdZXf6Uf7oE0SNGXg8S7KLDJH+sWT8MQJ+bcs
         m9lnEmTuwMjmYcSszFbdTIhamhjK7dTJIcbzF4W7qGFZowZ5cFjQ3irpn/NiF/Ou9Q7i
         u7j1ZWBQZ+Hc79Gfc1/bNwkXAndHmuPYWZxITfm2QfSQSMDTzjPYPQ0V7zW+04/TCKnw
         4ndlOyaOZGt32Ds7HcWMD0mcPqAxHF/yBr2HSuCMMQkODWPqdsTTzEfk+LqJq3qSrfAR
         vwvCGX6WENjvQGzsgwPFmrQNjqAwu8YVN9yavQUeS5DT+P9kAtRsLObAU3deivlQ+0M7
         1ryQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794962586; x=1795567386; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=QoQgSM7knlmQduEbalOghi/sOtbUt1RV5d9sPkjYyyVMIE6R1Kp7b4wimTkhe2Yx9I
         bQMdOzdqMed+XivU6bq71iIaeaVoVc7sZyWfap2u6yi7mll11YX8P49J3lvA0YXdc+nX
         ZTDSbaBadvIpnnxmFa+Tri/OuLybsQtUe8BaIEz6Et+INEWS1J9mO6tqyrP5pRBfS2ys
         K8BEF2IqiQQrqxBY/1lNDNLhABCxpAGq06QUY+MXEHZICS9TzjnYQKppfWjSpaRhGIBF
         ogBWvrfRSzVZPHTPGNTRNdjyZ58WBn0UWOcANINrg0lCJV4LPen6qxERF29IH31qzMuS
         ngZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962586; x=1795567386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=vY0sJa1jQT2TDw6xuklQbFaNvVFSj6nTrQQGqLkg3INyTdgXgsQvGzvh34OdvyEuOW
         gWZlx5thjh8T2Xf8rRHbFU78i89C1szMNYq3wkHCuP2wGVbQe1HfyTpALzbFNSyyaYxp
         NY9rIDkQ6XWBnbyiPR0Gev28CSaVJm2ogvML4FZjqBh8WYmmVtfWuyNufWi7aNXwIPT+
         ef8gC/an48bnddP37jq1tHOpbup70sBVOCiXuEqBdlNB2n50831jeQrY+UIFccGKJWU6
         Em7TKgEM7FHDzcHqdpZGRhGLCkaUgPzh2NIe0o83FUBDvWt2oVZvPwjihbQEZn3spnZc
         CG7A==
X-Forwarded-Encrypted: i=1; AL+hErHMoyPm/PtIhz487xBCh6Yksm3NKjV6cLyki4fodKvN9fiCixhD+w2aq1gGMO8FPiJTD0ogtY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JdWNlnUnyulKEKIgKMjsCyUEYiTaYwtubn4QzcvYWsHlrQgH8
	Hl13RaGVQoJuFcTsIHAGkToKgp6LIk3GlOQM+Wq6vlY/qMZTIZeU5Oj0Woq4GAbmyyUa101CFuW
	pH8LrzX4RZtC/vWgmeEPVQgUaTgytufnaNzXzXcTUEQ==
X-Gm-Gg: AYBFou0p8/JD7/nB2945KLdg28ZfaIaIvV8r1cmfBREBnjbUY+78M531ZYiCKCZ3HFL
	jvcG0ijorV4W+PI3KSvlLnu/0lujnVmUBwamhY2ELU50T3B3Vu79/DE3G3wfrVFZQFwUjcrUi3L
	XeAiBL329YqEFWrCt4t7Sm/XnIl++DFE2Q+R/vNdZsMzdU23tLi/C/K6XXIqEdEgut0hpT5pKv3
	NVgnTSn49jw1QS2bAP4jTA2T9tUGv7zG2VI+jBpgr9W2TKVeMGmbJ2TOMabrAVtjRIp6rWySKef
	Rya3K62lhsclQqpvQKIwaIlXP8ccVn5iEITFunwXSkEYOkdTMHXuhZoisAerCC0kcuUCGSuS4iw
	hvAJQGoHhCYvCGsAV/CSU/BOQe/i6ysQZti9bo8bvDyaaCPg8t4LU5FJ4G3U7mdMrCaUzrRgCLG
	/b3X386zvgOA==
X-Received: by 2002:a05:6871:b11:b0:491:47e1:6280 with SMTP id
 586e51a60fabf-4b75bb74ec7mr770348fac.15.1794962586147; Tue, 17 Nov 2026
 16:43:06 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
 <20261115113902.4834dda6@kernel.org> <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
 <20261116142710.347e8571@kernel.org> <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
 <20261117161856.6f6c2ce9@kernel.org>
In-Reply-To: <20261117161856.6f6c2ce9@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 18 Nov 2026 00:42:55 +0000
X-Gm-Features: Aa3M54r-Qn1bATmm01-LGWkLr4tuoSPVNlK5FfS3xcLFtqloul4EQ0s5CX5Sq4I
Message-ID: <CAG4wq-cQVUJgizeowhr4s4Z2Q_o0_dWfAwzXthpBATBB-7edLQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

Thank you so much. I am really grateful for your comments, and for
spelling out your views on this problem. I learnt a lot.

I would like to share how I see the problem. I understand that you
want the setters to mirror the existing getters, so that the metadata
stays with the driver. But I see a fundamental mismatch between
reading and writing the RX metadata:

- To read it, we must go through the driver callbacks, because each
  driver keeps it in its own descriptor format.

- To write it, the target is always the xdp_frame or the skb, and
  both are the same for every driver.

So to me it is natural to set it all at once in one helper function.
This also makes it much easier to support a new driver than
implementing three callbacks in each one.

Overall, I feel this has turned into a deeper difference in design
direction. The same question has come up in several earlier series
too. I will discuss it with Jesper, and we will come back to this in
the near future.

Thanks,
Tianyi
