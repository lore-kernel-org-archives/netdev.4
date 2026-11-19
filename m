Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095445;
	b=WjLlV895fwOO1+LfZVDYPgwEh4RFdWIGXi0QolRwGr3AwlN+Z+3kYIk+5ou3sS2qF3nf
	 b87B4pc67XDY/k8MxgJbvLxnOB29PHVBcUJpAKhLx0vVbrEc7c2VvhtEv07vSdEqqte1F
	 BMYitTx5J5dj5zU9M8ELwoWityvhqN+dxG2YGjeMh6NNpLA3RHlaHV5D+ljHJybR8BgD0
	 VxCVr+a5/Jdxsdq25XH9ij2vtQllHiv5s1OdzuKukQAazBDEITNVgB9n6qt1CmzGwNJIq
	 9hjYf1ZIsxm/6tH8hIkvJ93uygcwhh5g4wHiYrcT2Dp+cH7+gxYdS8HPlEdPPkxuyOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095445;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=bA+uIY5RFZ8OB/jlB1r7RJOWCT3CFj5h76bgguJiHYs=;
	b=HTRk9WAs9FyrZNPXnszIeCfXMyQEOP5PV+l5NSiW5GqJOJbcHF32zuYnk3nv0cqEb4cf
	 19y5V/wS5pGk1eMHMakE211Rw2/d980r0ELX3hayobeibIz/wsfqQQ59zDH5LAPLaMJwc
	 Zoqeq8g8ZW/LKJIsh3F/wSCqObMEICmVD9u5f+U6nijPBaNSbRZo8mzLVYVjPoopI5fOl
	 EM3/Y8GkjQk8owXT/cusH6CTcHdTrVqr4BCrqZMiQNOs9NJHwXf8NFHApYVbovWhJE1lE
	 E4i68y6Wdct9SB/vidcOtIWezD/Q9vnjwz5ppKJVBpS9Vb2TKTTTfYjfJHJrvMLgGIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkXCAeDh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E78606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkXCAeDh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95B51F000C4;
	Thu, 19 Nov 2026 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095444;
	bh=bA+uIY5RFZ8OB/jlB1r7RJOWCT3CFj5h76bgguJiHYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkXCAeDhXWl3c/1Aq+0fHDgT7WQu7M0Qr8Ywy+7JIwT4YadpT9KysFV6BPVQ6+yWE
	 9XONybSkGixuueVZcdTGRonnwvk6q8yl3JbMP9ay0ubTyJGxdsxASvtv7hbKUeLzAf
	 bHmoS2XSu1iwKjmZyuejtPGGOteoU/w6nSiv9Oo4Ipm/v2GUj4aOm0DHjhh8+3Yx3U
	 NE1VFz2m++t9gd9cFXQxp6lMFWdW6TzoFOrOMFJHlClOcVCy81ASsAE3PrgCh29oTG
	 6a2hfLmwALTYAxvh2gFXSXUZG4VTJSaafcuKrIxtUdcluwiCSDXpe5uoQlXvCleEhr
	 Y3YsJbskcXJhA==
Date: Thu, 19 Nov 2026 13:37:20 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: victor@mojatatu.com, netdev@vger.kernel.org, jiri@resnulli.us,
	jhs@mojatatu.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
Message-ID: <20261119133720.GY860048@horms.kernel.org>
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
 <179494556684.3136.3254895311432959761@kernel.org>
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
In-Reply-To: <179494556684.3136.3254895311432959761@kernel.org>

On Tue, Nov 17, 2026 at 07:59:26PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The commit message says "A padded text ematch is the same size
>   as the request that installed it ... Since the dump is no larger than…
> - [Low] The patch fixes a long-standing, user-visible netlink dump bug
>   but carries no Fixes: tag.
> - [Low] The commit message describes the impact as "the ematch list is
>   therefore misparsed", and its reproducer needs two text ematches.

Hi Victor and Jamal,

I'd appreciate if you could respond to Sashiko.
Even if it is only for the record.

Thanks!
