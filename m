Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133731;
	b=lkgBaQhVx72KGgnkAYktae1E6Us/ojhfPTdkvAn4ErOAwgGIDfWsJlm3E+jL7upGrhl6
	 4cJ+cZo9wnMtZg7KXn2si+inT5EAGRKy2Z76XVV2nU4W/48apczc+PzgXvoMeasR5262T
	 Vtxhf0T5+G/IbF0p5+3pTYQXrdDHu+2B7N64fs96nji99kBGEgAhxTYNaruxA5BeD8svY
	 JZXl9mO/ZumhzanTad39B5eX2/Ceq7E0v4P0Y3IXtFBpQ3fuzx5J0QQlOqfWDrSgN11F0
	 Sy/NnLqsTHT+fxjwn8Aw0zOgaS7A+eUskPPZyQbVpVLRO/VVmfXlpp1D+R9g92sbNGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133731;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TGAIFdomBs3si+EC7jlWvCPtv3g04WD3unZgP0aqsRs=;
	b=mta4P7Sf6qVgQ/f+NZoBcmx9hMXTq8wKDoJDzXlTqPLJtxU8TgLZBSLOmigfw2kT2xTk
	 muYYeBnBRQbLGitd9zCQHT/ij52wmlXgRegQZvKFCN11CQ6L8bADkV9XMmjYgzt4AaYoB
	 qywRGu0ZGuhGlUUP4zxR+3UY/b0fdi+IcXgwjF4R4Sg4bwLtgTy7sSBgNr8w5wsqUh6DP
	 7WfUPi7dhuYfFP5pqactmXubqRtiXdP+aT87rGqdTxeZ12XTQ0HCcFiAWp+J5EuTat26i
	 psAJYr3mxuaawmT1TGdlIZDSC6+sxtuhRRrarMat5WF1NSKBZtj+fk4RIw4k4xsWRhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLPRhAlk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86FB606A320;
	Fri, 20 Nov 2026 00:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLPRhAlk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A5C1F000C4;
	Fri, 20 Nov 2026 00:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133731;
	bh=TGAIFdomBs3si+EC7jlWvCPtv3g04WD3unZgP0aqsRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KLPRhAlk0ACgoitR9dLSZc3QKxc0o++8F0qqYvsmSbK7V1dXjT4dMeJGQzET+kktK
	 AmU+MiMATEvybCn7HFe4fKUhlk6lnlb42s4TehuYLcyXdxUbJnzCziYhMtVzohJakn
	 nsDf7SxVQcNog2tbeEuI9i6UGmgSfBr79+0jRdpVNTcaSx94Nflcc+RDYb400Jw1wr
	 jsa7zJc8JRUxSV5bfP5s73sSzrAAE22670vm9kOLt0ReM8f6CsOGEGszaQWipdrSaQ
	 i6FtU8us7QgWrF0VpUOiycqY/Pj+N0wPokqagyYwqO/s+quN1XX3PBZkFVgx1uc1qJ
	 fbhmG8XFquWcA==
Date: Thu, 19 Nov 2026 16:15:30 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Daniel Zahka" <daniel.zahka@gmail.com>
Cc: <netdev-bot+sashiko@kernel.org>, <alexanderduyck@fb.com>,
 <kernel-team@meta.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <edumazet@kernel.org>, <pabeni@redhat.com>,
 <dimitri.daskalakis1@gmail.com>, <mohsin.bashr@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 3/4] eth: mpnic: sync unicast and multicast
 address lists
Message-ID: <20261119161530.0dc624d4@kernel.org>
In-Reply-To: <DMY9FTQ22U8T.JKYB4HL8J8PH@gmail.com>
References: <20261116-mpnic-l2-oot-v1-3-8dc6eb3582b0@gmail.com>
	<179499313262.3136.12811016164943625265@kernel.org>
	<DMY9FTQ22U8T.JKYB4HL8J8PH@gmail.com>
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

On Wed, 18 Nov 2026 05:21:44 -0500 Daniel Zahka wrote:
> > Would it make sense to flush stale entries from both lists before either
> > add phase runs?
> >  
> 
> I see this more as a low severity issue, because having the device be in
> promiscuous mode when a slot is free is not incorrect, just not optimal.
> 
> If anything I would probably just rerun __hw_addr_sync_dev() on the uc
> list again after the mc one, if the first call returned -ENOSPC. I
> didn't think that was really worth it when this same comment came up in
> local review though.

Ack, IIRC the MAC table is at least 100 addrs, so micro-optimizing 
the ~128 -> 127 transition isn't worth the LoC.
