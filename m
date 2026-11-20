Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140182;
	b=rIzdgq4tEhtDpaeELGeIP8nTuzAOvMQ7qnTyJ6Ie1UAloh5AyRaWwOq1m66qUHsMwWoU
	 pa/pLIwq9RjxaaRQjA++SNeTWj0r64LcmriQlnzBeOvHHNtU7r8PvoSzr8XEy/0vYl79m
	 zyByaMoBRbZKsdpMN9XrgbozY16cj1aiAMo1ZYM67Sa3kpr0qx/rxcvlpwurWe+4ZHbkJ
	 /IjRRjKMc7FjMCFsMZVS7LKRvxF2Ex7USspLG9rCHtggepuS53GiIuLOI6Ou3lFKQ3DCz
	 04oM9MVB0irlV/cDoJn67ajZ67X5+BCbm2+wGR+mw2v8HKjtcpOYXw5pO8mjPCvPveg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140182;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=E3G8DYfuJqJoehSmP4pWO72yZ3Y+51dj2oaq6Uoc+6k47VKlhpObqQAZbwvifqRMjCIS
	 tVaLAj1GZmydOZRsHPwwYm7wsgsi2IL0FyR6xCFeFPo6UkFyjb/swVHb6C5iRdWPaA7RZ
	 Ag7VfHuZ3Xhl4Eil1FhYu8gvBMdvBl3GmaD1lEAOrGKb+OwoTIxi55gSE34hQ9RrKYVyT
	 /KQITInOghmLpxNNo8M3DkqDDrab8D2l4MOnHf52I7BhOuAV1QmQKiTMA3rhe53JM0QPX
	 luYfU9JDCpWaWbfXzkAeINZtQuu7DbFNqtAIphgoBgbSDTdDbg4a6YrfTQBYQA2Ii4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVsQekj7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270F606A325;
	Fri, 20 Nov 2026 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVsQekj7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2C31F000CF;
	Fri, 20 Nov 2026 02:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795140182;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eVsQekj7PidktjvgzrEB7APWuXKaIrmytQxwnVnx+kKqvP2HRxCzizXeThzrP02Iz
	 sxWoAEofFclNhO3HRrJiOtni6DISBHxRcKUe9yek60jlZHZx1Au51hT0GITUJ/rL+8
	 KsuUDj3x24oD1DZgqXiiYs0IaITQlVW7nh50d6RbBAPQadkh7atafCMuQfx8u0tktJ
	 98zM0oGKgdae4IsLQIljDPQk8VLr6CXXx9q2NqkymvHQBUfQz0cy3VatuRUvzM238i
	 9IzLT7RXRWKXeBDjqPZSuPenrlInij8ilY7cDni4p2l4x7L71o5pB7pPqHbwhh8CF7
	 vweV/U1kG9pSw==
From: netdev-bot+sinfo@kernel.org
To: Tim JH Chen <tim770802@gmail.com>
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 haijun.liu@mediatek.com, ricardo.martinez@linux.intel.com,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 ilpo.jarvinen@linux.intel.com, sreehari.kancharla@linux.intel.com,
 m.chetan.kumar@linux.intel.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, tim.jh.chen@wnc.com.tw,
 Chih.Hung.Huang@wnc.com.tw
Subject: Re: [PATCH net v7 0/6] net: wwan: t7xx: fix TX push kthread soft
 lockup on suspend and RX stop issues
Date: Fri, 20 Nov 2026 02:03:00 +0000
Message-ID: <179514018050.3291.12379298766410717361@kernel.org>
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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
