Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807481;
	b=KFGTFcouOVQ+Rx3QR3e+PpGrXqIarOl8LmFMdUWbkPorL555sBQ4T5g+85kxliqGd6M+
	 24FrQLPcPX8EQv4Ce90Wq4N1IYtVdR9w4oi9lJrAy/NCSFCaE6BLJxIruF/MRnVgwxAxG
	 ErD7YQGcw8GT8T5wxz+eq1YVB0LKd72sP+PWHO3KSt/2y5jU6XmvIOU60DpxkXs86h3Qe
	 wljLqeu1/M/rt12NgurbkJe5ucMyL+S6Yu+8atVi9UmoEBzoy4dskRYuI1LshST5Il0G9
	 XgMSjk3abLUHjP5eDM8xNwgpwuCyYnNsaAklMZVVJR40luFUSSkfpCMNagIKdCZ5Gpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807481;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=uxJKWmxTJs68cI7lw1H0IIFvmrx8xpTPFWlvujYIlRVORw+Ln7guGj9nBypP1eMACjnx
	 Bx6lIwF6nL1Xzf1Oe0G/+6PqtAZ1yodeMgBCJ8jUn9WI4pj+fAWPXVqvNHzFElePvuxZn
	 RVrW1UBJbEEf4dXcnLdePLmegpJP0e4d3ZB8roi1AKKakgl1/xjBI+h0ZgpTBLK/mIxOg
	 +hAfsEwOUlxUQMKCybGKCR+7ktQoXyH8cf1DEMmlMIobwyaxJB64BPxODU3Vvwx8QXJob
	 4qXj+bTDJe4O3dcld80J4YBxK1UsjXNBU8jJLpxEzuezxGyjCrrj847+sX13l+fTEKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRk0y5El;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D5E606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRk0y5El
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9661F00893;
	Fri, 27 Nov 2026 19:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795807481;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QRk0y5Eljz0meipfpTm3ceVqc24v7BuK9XqAQVCbK2/mNlIVhTWCZUuGC2gn4KjEi
	 3ojR/HD8zK2UIcwo1e5I4uwwpsI1y0fHJZSTz6/pmeqkOS7ZOeKeAPs/St80fY85L7
	 l1bvd7Mk/o81rFUEdaYokfsnrfhdrL/Dpr5hPKuhgDjzY4s2h5xfsBeoqoHzuutsUx
	 2rIKCGJKO6uz+gDXLB11+Nxo33mUKTAymw8VvPE4gNfPSbQicSlADhZMihwxVuov7Q
	 s2U/5BwTpPbCGx/A5JBrx4Cl5clQsnRSjoff75dtWGNUf4BZt6dCxULse8jUD8XdnH
	 OrPq0+pMBk/JQ==
From: netdev-bot+sinfo@kernel.org
To: Ahmad Byagowi <ahmadexp@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com
Subject: Re: [PATCH net v7 0/2] ptp: serialize requests and stop active EXTTS
Date: Fri, 27 Nov 2026 19:24:40 +0000
Message-ID: <179580748014.3294.48327702061857218@kernel.org>
In-Reply-To: <20261127-timecard-core-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-core-v7-0-ahmadexp@gmail.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
