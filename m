Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706546;
	b=32veDFKiik4iqvrYkHw9bDGPblfQIoheIAlYBNRecVUK/s6eMaNpSSOBuQkm+03dJU1V
	 F/VUZ586NKSgz30wkLbkAaAKqcjRUKrDQGHByA0RmDL9jcP5eppK7I8p/0Tin1Qt9/u4j
	 vPar/G0Rs4JnMu+J0BQqJFSFKTf3Y9R4DjUBwpDSKm1Sey7IqC3gY2gRobrQ2+/9itGbz
	 Sf4K9E608OkWOm5M1q4KIkbZzxsfVDlmUsE6LP19wMwDzaCHqrblCLKbC/UJtMchjLC+q
	 9/hf0RhdQx4va7mghuyVlaPUUUPdFfHnnsW3245A3gMkPbcv3RiLT3IyXHCPvD+QXZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706546;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=VpEu+mJf+gvKieDmE+OajqJCgi0lHVmWfASEOdaIKk8=;
	b=hOq1hWKyW/i8ZzWF06F/qfnCQN6bCUEOoGUYXUMNOKPTd3biWDGDEAfHzjZSoQRFanMu
	 Q8RpQLQcAYtbEprvuon3kYzInZmlEgx5WUpfmmY35zR8FvLSu8e6AwyvKYK7295t6XHc4
	 qpSn5ndGazcYLkW9i0XwcTVl7UDNAXUYN5zaYriWanfEkeJPdvbvtLx2NFZWWTR89WhYS
	 GoX1PBupjPaZpTgQbzeqTRm8eJQuitVTqDVqS9hsyigQniLfVY4MYDoKemq+hZEgjM0KG
	 2WwvCrI8s0c25E5VVfJxO5RK0sTqVJfwUB8sGzybIlsNW1+y/vw0X/TNIJ1bUQRZm1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEc9OpLr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068D606A31C;
	Thu, 26 Nov 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEc9OpLr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89BB1F000CA;
	Thu, 26 Nov 2026 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795706546;
	bh=VpEu+mJf+gvKieDmE+OajqJCgi0lHVmWfASEOdaIKk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEc9OpLrRQryRwxV8IddLVdgynynt92DYumKR2IFn+vEihjjtYB7gIC7tpDqjcXDy
	 msJawpHjoufAASZpyAquIdGLtwwtMxgMiZshHvrKnCs76sBngY1nQcXcVQp9NbNY1x
	 0obQ+bxUiA2AgXRJwr8zSPHYTWnvhOxoQlI+vJcOAOFo/qeTmkht8z29lYWZT4CLGd
	 szmFmNtTipN5uQ8EeSOA0Bk8ZFS25blwR1Sloo9giQ2aA+b8fPYqFQjWJe1RMA3R6d
	 qXBGLnhth2wbY4e3/93sXIHKfEKpiTJGOMLZlS8NIJQi9uQVWH59r83oYNTb4AAdgN
	 wMntd0bjG+mag==
Date: Thu, 26 Nov 2026 15:22:21 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: nshettyj@marvell.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, rkudurumalla@marvell.com,
	sgoutham@marvell.com, rkannoth@marvell.com, gakula@marvell.com,
	sbhatta@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net v4] octeontx2-af: Fix BPID leaks in NIX backpressure
 enable/disable
Message-ID: <20261126152221.GC31322@horms.kernel.org>
References: <20261119085434.2598197-1-nshettyj@marvell.com>
 <179542493892.3135.7516887793037759713@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179542493892.3135.7516887793037759713@kernel.org>

On Mon, Nov 23, 2026 at 09:08:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 3 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new channel range checks in nix_bp_disable()
>   (rvu_nix.c:672-677) and nix_bp_enable() (rvu_nix.c:822-827) validate…
> - [Medium] nix_bp_enable() (rvu_nix.c:832-857) still leaks an LBK BPID
>   whenever NIX_BP_ENABLE or NIX_CPT_BP_ENABLE is sent for a channel that…
> - [Medium] nix_bp_chan_disable() (rvu_nix.c:624-639) passes 'cfg &
>   GENMASK_ULL(8, 0)' to nix_bp_free_lbk_bpid() without checking that…
> - [Medium] nix_bp_enable() now saves each allocated BPID in
>   rsp->chan_bpid[i] (line 844) and later reads it back from rsp to…
> - [Low] The commit message undersells one of the problems this patch
>   fixes.

The above concerns look legit to me, especially the mailbox TOCTOU and the
BPID lifetime issues.

-- 
pw-bot: changes-requested

...
