Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476384;
	b=PrJ0J/4vVLx7smvty8BLnFaLpKsXIuZeXD/U2AQYrUl5UHxtAL8IyuSws3dgynhqKWOr
	 Di2lUYXfuzwDbVduBf1jDaJo17V/pEDLXecwWlIn2JAhRMv/TqXiCfNkQMjgQFuxDSAvo
	 /gT4jNb0TcDoSpE+cAouwIKtbJZ4WINgEjGICjGaztxZTOJDuW7Y4JAExBk4da9ZaSLST
	 IsAG2jTqoyELk1nCBlaC3vXZNV1zRtUIUDy0Y1SaLBlb65Do0FZau8OdYeVrOFWifsVpZ
	 xgFG/4hNsPOa+fR0CMQlfujdcB4Kmu0ufazq2XGldRjbKkjAr0q0zZdgsB9sYAJ1wUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=MQWlDJjW8xpL/p2sZ5f4jnbMjOG08OgWckpms5J2u/g=;
	b=I9n/vQe3A66NQhjsLCC9K1K9dqmmi9KEIvKNDPptwYoiEuY7teflD9iF/hEHjQIVwO85
	 8MpHgPioHS3jKbgs6yRy7pHJoLtBFtLmcfd68t1RH5Niyn9N8NPoP0+s0/pUwHq1hIpf8
	 KgeOQMuEY9Mky+gepn3SCZR+LgsrVRmGw4NPGnXAgxdql2ZwVzG/YEV/Ho3XvFUbDh6lA
	 jCTQt2EjZaqyDpBue4Ie0l9/VrzP7BMnTZWmVM/Svc7GjVwa7+c1dSqTtvNstX6FYaPZg
	 sYee7CME5nVXDzSSH9wFdDUR36HACJdbuavz6d+mgZ1j+lW+ItKhNDMiSVbP1n6AKmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Ny5pcpEZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710A606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C710A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Ny5pcpEZ
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso1355909fac.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795476383; cv=none;
        d=google.com; s=arc-20260327;
        b=rN2sEm0rMDl9CtY3fiElFf500VEgTpkejF8hJrQ9DNSsxfgfh/RFPoeCGKnHBfTGXq
         OxEv0sWt8nRW3ENlK/htEC2xK1LPbR+pB0PaG/v2NF4SzCkaSrQCsjHs5ZwGfAKjV+pg
         zKukNBg4rV6Y7KuooLnMWl15u5p4TlI4GGCgJA8s/RYkQdJgoCFg/JPylqQM/OGZve3v
         9EjHJp8EiEssZK1xeCDJzgUIFnHFDykolmxjnYwg5Kcxg+gqTbRLMq0TzKuEN0vWS0KK
         RCkaCU0FuF+CZZ/+q3T0HdZNqEv7PNw4o97qCtUjuIhaj8D8g1gCSoewkflaTOVfVPMw
         uoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MQWlDJjW8xpL/p2sZ5f4jnbMjOG08OgWckpms5J2u/g=;
        fh=WiRJ1poBfOo5QwsKnXd9XP8mbDsyRcvCUhOQN88dpe4=;
        b=OXPrHzagpSuO7XeAG65iTl/UdTDgBretLDRLq3Ks/J6HDs0vF7L+NmO7A8UEWOoeVZ
         UgbVmS2RjwNrOU1xPl2+4YV3n4Cf0GUA3peKMLz1395mDRfrm3X1JPDgRCvGdxuQsX87
         U6MD+r2g5sWSTHMlzdYyEWTBEXO3K4P/x4xsw+u4cmXqQvZ91a14rYxZbv2aSPC0ym/l
         0n8lqZJbQ/i0peY+enRyUnnVUq1mFrElX68TSHdPkpMsr4k4H+FYQ2xLAOwBLYzwkPG4
         +hKaeQ+2+4ZvsejFF66Dwh/h45FxdGyzuxNgS7s08IVw8OqzjuQqjQqCCQ/4nKha0fZV
         fZDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795476383; x=1796081183; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQWlDJjW8xpL/p2sZ5f4jnbMjOG08OgWckpms5J2u/g=;
        b=Ny5pcpEZW/QhMUJMZc3xvd1BJPBd93ty31NAL7quY331QK2N7vYBQrggjZ5J7SKd6w
         lQqECpjRBFmlGJ61ZHNINiqdYDLVuxBX76cPTDe16ytr45ux2GzaTCIY6YBjFjeBd576
         xbOG7iHumylmDGJlj7p5qqsi8Kb2rYyzhVUDQxRI75HeZlNp+Yxd5Q3AfBM7Yy61ydlN
         vq12SvSOC4VvPBOndIuIE1nvO/oskcCtCNweebWQRrJOQATYw/AeXFuXJcjfpyEjlD8o
         cOUyZGegh++M8dPUSlwg1cbC8UC5WKKjg4qWn6wxSVMklfjynhD5O0HJo4JMfkqWYjB9
         xk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476383; x=1796081183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MQWlDJjW8xpL/p2sZ5f4jnbMjOG08OgWckpms5J2u/g=;
        b=az94bZNXlJX8aiIjN19t0R5w8AxFz0q3kAbnT+wAM0CEh7g/QQ+ec0fKEj0Gb+LOjm
         tg1yoyv+4PuJKKfbgsYPNtDk9ViCN4I0afbWjw+WGOy355m+2KrOqlLrBZQItXiCbVnO
         siCVupsVd8ppwLBg5KjbkylVPVAPPy8Z2BZEd5xmYlCQ50bs4dSt5Y0g8LCVNWvsY3Q0
         9YkPibdoK9d3iTPAX6vIgd1M89EdqauLam5j3a4iw+JlgnAcoEFkdwqkUe75Ua4rU97/
         mDfQ90E4LSjznuV+wwz7jj3e5UUWxpgvoqlQTy5YZu/lnocyK5vgoP3ZR3U3aTKZ5vt/
         Y9ug==
X-Gm-Message-State: APuU4Z+KheOxfOLP2cy92aNGt6p0uh2EhQOEBh6tjI2KyoYVur2PzkN/
	0qHEA2mHuxJVf0mDEILOBCnIAbX/lWlHXRQidfFhfH970DBngf0ACdNeu/BQnwixcapHtzqtHNS
	OdASndbc3N6fs7UcAkQh/0WUbGtMe+wFqQyNXDIDywg==
X-Gm-Gg: AZFdTZfwx3G5xP67wP24uEnLuzd1RnORgBGcgPlmRifth9vmXMoCZ64A2eC75q0MAWH
	UMyMRLBvyDOiCX8nLjzEdF/pjbyiDCGOL04LfihxDfWYyJKbiVIatP+ETz9r7lDA4u4ZZELF8ct
	ZOst257YYCrjkBhKHVmlSzevU+YTrW65mzqeErx55vx4bR2DcEdtqoiT6q66W+q/AlhWGasEq6s
	Zs9yxNWKNiFKn15LtC3PsztjSmlF/zzRLNnhAQ6YIV9lei7O1aykpnuQe/PDY1K3g+PFDLa50Jv
	J0Yb13coJB9iywg6mBKjnfBhZXQ9dRcaZdgb7OFMfaC/Idtv2t+saqou4r9Qjhsdya+FN5rxMyr
	wJc2VGd0Fh5cKX+Myw8X6AlGDOC8Q05gH7y5E2XETXkH4pLiB0N+imfl29PhUlTICvVm2x+Wohe
	ePamwQH5E++g==
X-Received: by 2002:a05:6870:31a4:b0:48f:e0f6:bd58 with SMTP id
 586e51a60fabf-4bc860f05e8mr13202699fac.41.1795476382627; Mon, 23 Nov 2026
 15:26:22 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com>
 <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com>
 <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com>
 <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com> <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com>
In-Reply-To: <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 23 Nov 2026 23:26:11 +0000
X-Gm-Features: Aa3M54qQLsKa50Hpke4S8nRP-l5tPOwhsGlHSy5rlgDYx5CUns_VsM1q-PHhDTE
Message-ID: <CAG4wq-cG1bseTFczZTjashN75J1Jsrv=u1ccuRsY-N1kZ=SXXg@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	tianyi.gao@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

Thank you for being so responsive, and I really appreciate it.

On Mon, 2026-11-23 at 14:42 -0800, Alexander Duyck wrote:
> In the mlx5e case they were disabling the feature via the private
> control flag if it was enabled. In the case of your change you are
> just disabling it without exposing that it is disabled.

mlx5 does not change the private flag when a program is attached. It
sets MLX5E_RQ_STATE_NO_CSUM_COMPLETE on the RQ, and
rx_no_csum_complete keeps its value ("off" by default).

> is it falling through into the CHECKSUM_UNNECESSARY path with all
> the indications that a tunnel was still there even though you
> stripped the header?

Yes, the same path as E810, and mlx5 does the same with a program
attached.

> The issue is that the driver is making a number of assumptions about
> what is there based on what the hardware parsed for headers and such.

This was discussed in the thread of [1], including the decap problem
with csum_level. The summary there was that reporting
CHECKSUM_COMPLETE on the XDP-to-skb path is unsafe, and that the
safest option for now is CHECKSUM_UNNECESSARY only [3]. The decap
case with CHECKSUM_UNNECESSARY was left open as a known problem.

I am also working on the long-term design in [2], though there is
still a long way to go. Please take a look if you are interested.

For this patch, my aim is simple: stop the "hw csum failure", and
make E830 with XDP report RX checksums the same way as E810, i.e. as
before GCS was added.

[3] https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/

Thanks,
Tianyi
