Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305030;
	b=RcIIFHx/J1eq6/A6JmztSvH4tHEfzLBqo4ZDkoM7D2QHaxQRPgxG4iOhtdylmJYaGWmX
	 xcX4b8lw4FdMQiK7O0Gshb0vOGk3XwE47qr+AbN7nCAcgX2ljt1O/pnMifeN1WilAJrBK
	 pCra3ZrD5t9ruf2U3aukgX7KkQSh85M/3fWl47m/MPQkpxuGbumUcrPOzqzG8m/PHZnrU
	 kBVIN+isxwCiKmr8IvELzHVHucWy1GKWYucXhzy+7iTsuofz9KY7aJfb3SPCvzV2xFvKe
	 D19X0/i+fzhumUdL4W6q8qhZ9O+JKhl+I/iw/LYWOMRyOKUzFG5kpj7YLth2g5w6NWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305030;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HxIMNa5HNEesDqDAjQAiXjTysBA/LYNh1YRCRfM5f6U=;
	b=nEJ9k2plMD4x89m8s50yxgHangXWk7qYDUa+QFCHGayanuyCUWG+L+9R5gVol4kc4pNh
	 sMK70qlbVAKc5L6dxI4BwPTDExEYegi2O0niYsPAdpIKQHHwB4pIpVvbO5SAOjRYppD+9
	 FtSDN/aXXenepngc2vxfSDhdVMOpRDsenJectQ3I4dyRpzB+VPLnN9mg3jw4P8+r2/lJI
	 IpKbZgELKQVpQc2mRAXACpCEIkv0aLuyG4TBuIKpr+6Jot1UUu9pBy8MKmasJIfRQ/lcI
	 UEN/H1KSGZ5EOYS67PVDhrHDAfufpiy6FAqYX1h5+dEX7qjTweTV7yZgInarutrAIfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cV390aB3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497C5606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cV390aB3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A7F1F000C0;
	Sat, 21 Nov 2026 23:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305029;
	bh=HxIMNa5HNEesDqDAjQAiXjTysBA/LYNh1YRCRfM5f6U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cV390aB3Z7rluyL9jtkRX3EMnjOrkSmmSJCGit8M/EUoLXAAKeq2OzTnJPEzP7L/Y
	 eUnxPtF5cM9fpLrq06Ai/cQOHCxIU757Fac2Lwh+/qPeSY1p2etjcRU/y3Zi7U+uJu
	 5aUB1d4k7kUq19J+cyhLrcJAQoUyoFsLLpbX2p6uK8MYnn0KZPuY+UQvj29nE4JxAp
	 riJzTN2wHRJmCHvxpAuCE3hV9/8dnAflhr0UvbuneZV+kSXoJ5pmziQEjFpAhOxwT8
	 UIqispTLtj8Qm2ktwTQYWkAXv8x0P8ONEaAyTWPq7psLZZU68bi6h4FxEYjw4ZlCv8
	 +jSEEofnNPBbg==
Date: Sat, 21 Nov 2026 15:50:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, Victor Nogueira
 <victor@mojatatu.com>, netdev@vger.kernel.org, Jiri Pirko
 <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
Message-ID: <20261121155028.44552d14@kernel.org>
In-Reply-To: <CAM0EoMm5jkHBnkdxKq_TDs9uwBWiJSqrJLXc_CWOOoT+_+X6mw@mail.gmail.com>
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
	<20261117141653.60ce5d92@phoenix.local>
	<CAM0EoMm5jkHBnkdxKq_TDs9uwBWiJSqrJLXc_CWOOoT+_+X6mw@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 17:54:28 -0500 Jamal Hadi Salim wrote:
> What is the problem? This is the standard format sashiko likes:
> 1) you describe how you came across the problem,
> 2) you describe what the issue being resolved is
> 3) you describe what the fix is
> 4) you provide any extra context
> 5) you describe what the conditions are to recreate the issue.
> 
> If you leave any of those you will end up in version 5 in no time. In
> fact you will immediately get a note from Jakub's bot to ask you to
> explain #1
> Where do you see the sumarization/shortening happening?

Fun fact, if maintainers read all the commit messages for patches
coming it, and it would take them 2 minutes to go thru this slop
we'd spend 8 hours a day just reading this garbage.

How is it not reasonable to expect the submitter to look over 
the commit msg and trim it.
