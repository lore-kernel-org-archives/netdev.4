Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289901;
	b=OIrFfUXFNZlzGv87JJhKin67cddLRCEMTFBnJazrxEaF5c/mdZ55zZfOB1uhKjDnyUej
	 qTbe+5vuUKcg/6b4K7UQSurtEdVenJhs6FqbAf9ryG7/VCH65ZzDnMDSqYhmbIVzKR17b
	 0SJ7p8hp1L5MnEF0tMLHCquQ3XOZjpagN3V62hGxPsa7y35kqq2/tbO0Zn/qji4QSfgB9
	 kjRYJUOY4yWU89bjEMEVMPjv+7UiURTM+wrWgLnZOCGLkA+xd5BQOBjCewzxKjMiH17dY
	 b+nUXtW/t1nTy2qveCkM/OGpOGlM+TwhgRLTzrm6Xy+r6lXx6dF45XKmD9FfgRQW57w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289901;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=D2Hk0Tlbd83RZGXyFSElUoIFvTUVExn0ZXHLSDIwiKVCozhLM4gWISof87bTL+SF9t7k
	 GLidkWQRKfTFxP3vISt7JXtJnXhYHN3hFUmVguWSkhI+ii8FyG4yUe7l81yctIrGfDyVF
	 klSxAz1yTRCH/3w7qb6a5YcrJAUTXO9dPVM/atTYNE5+tSYRG33TVTRY/GdmODZS9xlHe
	 JQQzSVn1dj9rbP/FwQMcmwgW15t8jD4qlS11EKsxhl414bBEBNB99dwCsZUhrFIhreMcl
	 5w/g0bATsAYNDvKpP0U4S4ODPwOvQEhqCBpW2nIiXld97qANXyf0RDYMYakMzJ/90pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lv+/SH8O";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CE606A320;
	Sat, 21 Nov 2026 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lv+/SH8O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D8B1F000C0;
	Sat, 21 Nov 2026 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289901;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lv+/SH8OPxiaVgKoABbMP2MYKEE7yF6C3gVRTrMyrLtcPPba+6De1qXqQy1wSO/si
	 2MPIFTzuqNq+OxxycubrlxR6xAVCucn4n7XIOdiDd13y6Z+Sj40jU/3+fUTCBym84r
	 TaOucHcFNEZFbQzvTKYHkxlYIZlfrV+OouJG4O2hwZY2+cOhShC4aESh5PtbFApgM5
	 kLmvANbY189T+MGFYmw8rchkERVi7XatzyPemPhTTaoyxi2B4vqPtFhUOAzGo7vyDn
	 /GTq2yQD67oQpSi++htJQ6js/J09P8Yt8HmdQGZ2CeSuwHzR7eu70kZNjOLHS+7RjQ
	 Anf0aWN8ikxPw==
From: netdev-bot+sinfo@kernel.org
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Breno Leitao <leitao@debian.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/1] netdevsim: bound the peer TX queue index in
 nsim_start_peer_tx_queue()
Date: Sat, 21 Nov 2026 19:38:20 +0000
Message-ID: <179528990077.3294.3095834745568902393@kernel.org>
In-Reply-To: <179528809256.2009509.5007624677973207521@gmail.com>
References: <179528809256.2009509.5007624677973207521@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
