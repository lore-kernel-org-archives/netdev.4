Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165010;
	b=rijmDV12DhtjdE1LUPlcqhgg/wiDZ8ZjfMeuqpRNRjvkv56fXoJNTeKrhZEYw5obJG3s
	 yOw/+pfCdB22SubdygQpypRgtpjoNChe15MkJQ2f6wl3GzBe0nAI1qOLoror0NbUVVRWz
	 m5u0kJ0nKf9pGf0JQUmuHTKopJbWvjS3A/sE7p/mP6/g0BxkYYNkYY+L3OE5q6lXxqdk1
	 IIJw5Q3ohJBFAJO+9buNO3WoCGX4B6ObJ/jl7DYIPBbVBsunGg/hVu44kJXwgRJWOcC5t
	 BPlkeNaCnP/8qrvCmrdg/vtJvFP2UANuPk1hzHAPMBGxOKfDPSqj99meW4U4DfATv2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165010;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 DKIM-Signature;
	bh=rK1R8ZHwVo1Re3JLTYlyIHvSg8L7skYpgklaW3rtQyc=;
	b=tvQxA2WOrRvxefvUdTQmAi8VI2lPiLgzjvTlsTcO2J44ToNyeb3K0RPsiKtMq909DByC
	 iglFKVWrNu6TfwJBBtEQD7/Bl60sKV73VBEP7YJC9BRhSaEtd0QCajO5HU9EqsnAMluUe
	 cbfRaRnt7dNZUCkeTm6C9fCmxGKrSyObq8jycy6bMAugDatm0dyQrx/LJCe31sZkgTwMB
	 iDxWOLXvL+GHqIa+bBR1EaaBWeI3bN9+VwnqfZczTkOgM6Jpbxrg2D+FFTJOBMQpoZbU7
	 worGMs+VIq+FpkPmMGK/2WqjUAF+BcJcRdWWhvM7FYj5iESKCSdkAfIKMxM2TFdlEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=J6yO8HMf;
	arc=none smtp.remote-ip=217.74.67.63
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5073606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5073606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=J6yO8HMf
Received: from nr200 (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Fri, 20 Nov 2026 09:56:44 +0100 (CET)
Date: Fri, 20 Nov 2026 09:56:42 +0100
From: Slawomir Stepien <sst@poczta.fm>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net,
	davem@davemloft.net, kuba@kernel.org, hawk@kernel.org,
	john.fastabend@gmail.com, sdf@fomichev.me, bpf@vger.kernel.org,
	netdev@vger.kernel.org, maciej.fijalkowski@intel.com,
	tavip@google.com, toke@redhat.com, aleksander.lobakin@intel.com,
	ilias.apalodimas@linaro.org, lorenzo@kernel.org,
	magnus.karlsson@intel.com, ihor.solodrai@linux.dev,
	edumazet@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, memxor@gmail.com, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v7 bpf 3/5] veth: use the frame mem type when running XDP
 on an xdp_frame
Message-ID: <awALSrKSY3GSVY0e@nr200>
References: <20261119133032.2015656-4-sst@poczta.fm>
 <9a5a1487a4676381f4c3d98cb5a22f50e2f54d9d4ec7947891c889b64ac12693@mail.kernel.org>
 <CAG4wq-favnH37jS2=a-aJwBgQOuW=KTsM-vJWp73PNDfFq4=ZA@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG4wq-favnH37jS2=a-aJwBgQOuW=KTsM-vJWp73PNDfFq4=ZA@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1795165007; bh=rK1R8ZHwVo1Re3JLTYlyIHvSg8L7skYpgklaW3rtQyc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=J6yO8HMfdTGMVDA94Am0LW+K4wYF4g+JzZfg9naHj1EuT3mypc0dr4qGcyY+s81tw
	 IdunbB8uJpsuRN2gGmx9lbm9vVD4z2s6w+NyAviXMnOfYQU0kqNa94d3O4GBHnF7Fc
	 OvDmp5U9GNIdXLFn8sL0D92Yi2tkFDSWUvBM6QMY=

On lis 19, 2026 14:24, Tianyi Gao wrote:
> On Thu, 19 Nov 2026 13:54:58 +0000, bot+bpf-ci@kernel.org wrote:
> > Is this Fixes: tag pointing at the right commit?
> >
> > 718a18a0c8a6 only reworks the skb path (veth_xdp_rcv_skb() and
> > veth_convert_skb_to_xdp_buff()), and does not touch veth_xdp_rcv_one(),
> > which is the only function this patch changes.
> 
> I think the AI is wrong here. Before 718a18a0c8a6, veth copied a
> non-linear skb into one linear page, so no frame with frags could reach
> veth_xdp_rcv_one(). Either way, 718a18a0c8a6 and bf25146a5595 are both
> in v5.18-rc1, so the choice makes no difference for stable.

Thanks! I will keep 718a18a0c8a6.

-- 
Slawomir Stepien
