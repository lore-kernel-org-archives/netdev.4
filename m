Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206425;
	b=3fOq+gh0qZAYRkYI+qdoSqh7aW4CVPoMDSC5nvY6Mv9Npp79nUx7V4PJGzTPRvGLuP8b
	 lv9KKYS0jqSKlglpRoZXY4U1p6XVaGvdeuFAIroM7RnwFYr/Rm0rq6dVphoE/mCPw2qDa
	 bDaGeuFJaYHsvMnbzON/W9UlwhFPMlMVWMMZKeyuxJB/rxjQ+eHPtsvSkYqVt6fb3pCEb
	 ru/65/bahWzzDoVhEQyb6pssuD4L8H9AvtgaZ1/9QY1Fit+6DbFiOtkf/envZtvNuBs4T
	 FHeXwi+4TCh4rH8km6NPLX288wCdkk+Hlbz3MRxQUmji3NOHB3PHiUGj23OPv1QVTNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206425;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=WB0EZxT0dyd8JUf18/AuzMZ5JlGz5D/bgFKYFc6MzC3GcDoml1WFFuoDD1oyzJOSxPYo
	 RnYGl/ee5qoxTZZCu5fW5y86wgMMTqj/byUgUJjAyLyoWv4nSTR5X7VsQq1kcN3HR5dBX
	 EXc58BoXdAvzGEIFF9FqEjkq3kmLLU0kq59UjdqY2gnuE3NfgNjfLhaEnYznuig4WcR2y
	 X5dH0a/ExxH1jtqKTXmjYoZX0dity27rAPNqPEx2fv7nhNUQ4SBSBwcX0ku6I/q+b7YOq
	 psY6Qfy/QJq0sk2N7vlVmUd17GF7TdrmDB5qvTGNDTqPs2pfNXYaHY4D1h61Vk2kWOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eK++v5+j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7B606A33B;
	Fri, 20 Nov 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eK++v5+j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074A81F000CA;
	Fri, 20 Nov 2026 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795206424;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eK++v5+j6gNqbk0sWKjlxq2XeOqiO7hNZua5OLVVkNZfFeOZh5dCiESKKOL/Nd7Gj
	 JrBXeddyJqYEL13sAWrOrbmU5dS7WQZOcap0gYvfJe1yDYzF+ph95UQAkRyLuJ5q2T
	 2+yL3HpXKLiVcf0DpAd16qPgS+nK4SsMowRxW4Eh0misgeULnOOITYnllptV0WANop
	 Zehyx4KdaZzWnY7pUTiSe75CLk6dbtLX7cfrbUHcRLWt8JrsLGidhAF3fQeGG9nA09
	 Pux3yGp8Dj99KOOE3tlOfYbwkz5HX0A56xk5lMdXbkPTxgG9vglETqHkGZrthBTgJM
	 jSVQN+RPFDgHA==
From: netdev-bot+sinfo@kernel.org
To: Chris Babroski <cbabroski@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davthompson@nvidia.com
Subject: Re: [PATCH net-next v1 0/2] mlxbf_gige: disable MAC after panic
Date: Fri, 20 Nov 2026 20:27:03 +0000
Message-ID: <179520642352.3294.1018427060462107443@kernel.org>
In-Reply-To: <cover.1795206150.git.cbabroski@nvidia.com>
References: <cover.1795206150.git.cbabroski@nvidia.com>
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
