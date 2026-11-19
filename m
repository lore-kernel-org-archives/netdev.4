Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046849;
	b=koC5ti66r7QCGAk263VQnwCraHeEaIuZmZIv1szN4sgQ4R/N+hJPl9VyxzJJsxqNfpj0
	 3yygP1MXUwcae77DZy4YDbTlSkMRf97M4saHiGzWFFiO8oMhY09ijJG4386R/CcF6Julm
	 rdWsWgWX1nDkG8tXNJNi1aNp8H7TZ53eZyrS2+tY1C7jVscuSeuaR9/fyGjJ1lyfFqb/C
	 NYAjlqxuXMv+onUlzd0epzDK4/pm5PSxlKxLbMDHCIcqUmsAijQ3YPiH9ghKYwHywL+Bl
	 FIbajOlZQNmF+aifDe5pcQ9Rt1jFz/p+R7bbyfCwwesjZkJ93TSgzIJrn/5rXAieWXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046849;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=iLDJEOICkTEd6KjGvdMTwoJzopVVz9vfKF6a1Dm+7u0TCoWYZhKeylZSGaebYg+LSOYn
	 DITl5sImWs+EesGdaV2A7QkTbM8zuEec/dB/iRl5FdcAaQXGuh+sI4Gy6cs4DnHl04tWu
	 iT0KoW0ZXbpqEZMbm9QE8PyuQIP1zNgFJUCjMvu3JLi+iaayMrAUPzrB7g5mqT65ZKvGQ
	 4YALcNqJaotYnYVAFzNc7COFRh/AMeCHO8vVVqFs0BvcAIEiMl4Z9TzJS+7pvwqNh8UC0
	 bubUSgJeLTAOz3mMuD61vUr6byirq7RQEmJsbzCOf5+G/iVb0135T9BjrDeNCftfvxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1IueEKF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C25606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1IueEKF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA71F1F000C4;
	Thu, 19 Nov 2026 00:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046848;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H1IueEKFqS5WVceOSa9LS6rT/LJCmRIUnPsdvO/DpUn7u4JQwVYAW3Orq9oTyfX6S
	 zNhd4S/9p+bJfYuW9VBnHrLm0gqJbXfHeimg94SR3cYxLhaNoUCgUTKhemwCbSqn/D
	 DqZhurt+D3naMSZ8Snb8eAlhcneH8nBHXsu4l9xGhGow+f5zVV2IyRdb7c2GhZknBv
	 6IScvzFPXYGzKbtHcosslOtsqIey+a2TDq8Vxaom8TZ8mkdeX5PjZ4tTKv8HotjyXX
	 V+da0tkKmuoFQwZhN38LPV/V4nMQPrOvWiD2zORc4gYwVo1dD8tdQshp1982Qhwthp
	 X8FBjdGHS6s2A==
From: netdev-bot+sinfo@kernel.org
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, nnac123@linux.ibm.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Subject: Re: [PATCH net-next 0/2] ibmveth: two TX and reset fixes
Date: Thu, 19 Nov 2026 00:07:27 +0000
Message-ID: <179504684743.3291.10300720489651147627@kernel.org>
In-Reply-To: <20261119000235.15622-1-mmc@linux.ibm.com>
References: <20261119000235.15622-1-mmc@linux.ibm.com>
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
