Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010142;
	b=3keFq/DqSozfPMM/vWfW53Hym3Gf8f4EEZfPd25QuG73fG+DlJ149f7kqED0xE3LWliB
	 D6tKbrZczZiuv9R5xikDzYOYwCEU/ia8xShxD7yttAKHsYn8/0BbOBjQ1XQ/fNkJ2E3aL
	 EJJNVWZu/YHfdJF9gWuMKeMx9y9Qy2qEArpg8+9f/Zi0ZeqSGeWdMCHy60ZVrTVkfSMwm
	 gblKYsvanOpYv+k4vRWp+GMB1Y59UdWMp9Sg6nMCXBo8XruVnlTqKqeOrH3tdMHCMq9gi
	 X1Shx5qOJofV8erpJiPt5Pie/4A5dZBsk2gWgqrKa+ylTeiBqKwXh3YVA+N484Vna5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010142;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 DKIM-Signature;
	bh=Ogx7B9wYG+j6Vq592flq68qRXyFMeckjKevPe2O6vnI=;
	b=z1XaMOvC2c8jbwgett4qn1+u+e5NlqVGtHXdv0rabJT8FSf2UxdUpsOQGjyJAyvl6uSg
	 CsvYDFH8z19YeYiMyFqAEwyRZZEApJk7IW9BqXg+MJ+gIs1DQ1hS/YTNnbTO7PKEs56d6
	 e/u+kGyfS3L9C3mCiOlkqrPA9qW/o/huZZc1lhpOsI5jS9wgkwgUK/pNJActnXj6jMzr5
	 6grbPr4mCH8MXkyc30WXQl4ov8Sh307q7o0DJjr+Aznwc7f5jCQev4+ZQ3CUbs7PZbUJ0
	 nCXlyHrHLkZ+88pKpbFYJJsryFb/9FN/Ed7bpfxnedJ8wi6bCiWV1EydoNXLMRebO+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=UMevEfb6;
	arc=none smtp.remote-ip=217.74.67.49
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5B606A337
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A5B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=UMevEfb6
Received: from nr200 (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Wed, 18 Nov 2026 14:55:37 +0100 (CET)
Date: Wed, 18 Nov 2026 14:55:35 +0100
From: Slawomir Stepien <sst@poczta.fm>
To: Jesper Dangaard Brouer <hawk@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net,
	kuba@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	magnus.karlsson@intel.com, aleksander.lobakin@intel.com,
	ilias.apalodimas@linaro.org, toke@redhat.com, lorenzo@kernel.org,
	ihor.solodrai@linux.dev, tavip@google.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: Re: [PATCH v6 bpf 0/3] xdp: fix page_pool leaks
Message-ID: <av2uVx-vYZM8Ox6B@nr200>
References: <20261104121316.1155680-1-sst@poczta.fm>
 <ausorQSZn/tuxUWg@boxer>
 <auw7ofYYYwOoGH2d@nr200>
 <833b2ebf-ac7c-42b1-bb75-2fc56e0f0fbe@kernel.org>
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
In-Reply-To: <833b2ebf-ac7c-42b1-bb75-2fc56e0f0fbe@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1795010140; bh=Ogx7B9wYG+j6Vq592flq68qRXyFMeckjKevPe2O6vnI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=UMevEfb6UPUVp/8d5Ht51sf82i2nN4MEQNAcBvpgACX7WShItW9LqPwNLlzhJ+MiH
	 XmRvSQWz86N1qLoETpe2q9YReH3W3RgAi0HyGTsoiWxYZ+A43nOD4FzAaZgCuAdCEN
	 e7VFWB+DA/R+jValnYlh/RlWwPXz+aIxPbXGVWhA=

On lis 05, 2026 10:59, Jesper Dangaard Brouer wrote:
> On 11/5/26 09:17, Slawomir Stepien wrote:
> > On lis 04, 2026 13:44, Maciej Fijalkowski wrote:
> > > On Wed, Nov 04, 2026 at 01:13:13PM +0100, Slawomir Stepien wrote:
> > > > v1:
> > > > https://lore.kernel.org/bpf/20251003140243.2534865-1-maciej.fijalkowski@intel.com/
> > > > v1->v2:
> > > > - add skb to xdp_buff converter (Jakub)
> > > > - postpone restoration of veth's xdp_rxq_info mem model (AI)
> > > > 
> > > > v2:
> > > > https://lore.kernel.org/bpf/20251017143103.2620164-1-maciej.fijalkowski@intel.com/T/
> > > > v2->v3:
> > > > - make skb->xdp_buff conversion agnostic of current skb->data position
> > > >    (Toke)
> > > > - do not pull mac header in veth (Toke)
> > > > - use virt_to_head_page() when checking if xdp->data comes from
> > > >    page_pool (Olek)
> > > > - add ack from Toke
> > > > 
> > > > v3:
> > > > https://lore.kernel.org/bpf/20251022125209.2649287-1-maciej.fijalkowski@intel.com/
> > > > v3->v4:
> > > > - include skb->head when calculating packet length (Toke, lkp)
> > > > 
> > > > v4:
> > > > https://lore.kernel.org/bpf/20251027121318.2679226-1-maciej.fijalkowski@intel.com/
> > > > v4->v5:
> > > > - rely again on sk_buff::pp_recycle when setting mem type on rxq
> > > >    (Jesper, Jakub)
> > > > - add ack from Toke on patch 2 and restore it on patch 1
> > > > 
> > > > v5:
> > > > https://lore.kernel.org/bpf/20251029221315.2694841-1-maciej.fijalkowski@intel.com/
> > > > v5->v6:
> > > > - rebase onto bpf/master
> > > > - patch 1: set MEM_TYPE_PAGE_POOL unconditionally in
> > > >    xdp_convert_skb_to_buff(); mem type only matters for frags consumed
> > > >    by the program, and those always come from skb_pp_cow_data() (Jakub)
> > > > - patch 1: add DEBUG_NET_WARN_ON_ONCE() for a non-linear skb without
> > > >    pp_recycle and document the expectation in kdoc (Jakub); the warning
> > > >    is limited to non-linear skbs since linear ones legitimately skip
> > > >    the CoW
> > > > - new patch 2: veth_xdp_rcv_one() ran the program on an xdp_frame with
> > > >    whatever mem type the previous packet left on rq->xdp_rxq; use the
> > > >    frame's mem type instead, as cpumap and devmap do. With patch 3 alone
> > > >    veth sends page_pool frames to its peer and the peer's program
> > > >    trimming frags crashed the kernel, so this comes first
> > > > - patch 3 (was 2): veth turns the buff into an xdp_frame on
> > > >    XDP_{TX,REDIRECT}, so the head is released through mem type too;
> > > >    keep the queue's original model unless the buffer was copied into
> > > >    rq->page_pool (Jakub)
> > > > - patch 3: take page_pool refs on compound heads via netmem helpers
> > > > - patch 3: do not restore the rxq mem model after XDP_{TX,REDIRECT}
> > > >    and on the error path; with patch 2 every path sets its own mem type
> > > > - patch 3: veth can now redirect MEM_TYPE_PAGE_POOL frames, which needs
> > > >    commit b3ca872947ef ("bpf: Use the frame mem type in devmap egress
> > > >    XDP") in devmap; list it as a stable prerequisite
> > > > - drop Reviewed-by/Tested-by tags as patches 1 and 3 changed
> > > 
> > > I mentioned the changes [0] that were developed after v5 revision yet you
> > > decided to go with what you had - that might be okay but to be transparent
> > > it would be worth stating *why* you chose not to pursue further or explore
> > > approach where __do_xdp_generic() is called from veth.
> > > 
> > > Was it due to semantics change pointed out by Bjorn? Or is it too big a
> > > hammer for fixing page_pool leaks and should be implemented as a
> > > follow-up?
> > 
> > That. For me, at this point in time it is easier to reason about the fix first rather than refactor.
> > 
> 
> I like approach where __do_xdp_generic() is called from veth.
> Look at patch link[0] below - how much (ugly) code is removed from veth.c
> 
> > > Regardless, thank you for reviving this work, I am to blame for not
> > > dedicating further effort here.
> > 
> > No worries Maciej! You did a great job and I think it is worth pushing.
> > 
> > > [0]: https://lore.kernel.org/bpf/20260509084858.773921-5-maciej.fijalkowski@intel.com/
> > > 
> I like how much code this [0] patch removes. Especially removing the
> ugly veth_xdp_get() function that manipulate the refcnt directly on pages.

Hi Jesper and Maciej

I know that the RFC from [0] is doing a lot of nice things, but after working on v3 of it, I still
see some regression. I was able to fix some (v3 will have the additional PATCHes), but more work is
still needed (or more discussion is need about how to approach this regression removal). That is why
I would like to keep this fix still alive and I will send v7 soon.

I will also send RFC v3 - as a place where more discussion can take place on the direction of that
refactor.

-- 
Slawomir Stepien
