Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611209;
	b=X6NCDTVpGRFGMoXlcB+lqtH+AzLOQt5O3ZwFHIhASy0NE1oS/tjex2InYdz3lRw/hZMB
	 c+ZZuFsvTsAj5JadDcWjLHnkHRYsVL7MnIdQ7Uny9lYpFGNOAHkubKGULLJrPlldErGKY
	 opZ9gylEWxGwEV9aA7UGke9Yq3OCLXcTNvViHoyzKIjoXGuG+AiYtPz8xCd8Ubut8/pLC
	 aR+lCkKY4kp3hND/XtGAaaL3TtUsW1Ayf3M4i+lkWp96lrTvBrEvyS66Jjq0E1TuzCYbN
	 YqiW0xNxxsNxvAlC5NZrhgVC5hse8QnDTYMrWmhaV9mZ78i8KExBqthxIekK6RMDVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611209;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=kWZxrXISItqDNaI3GqODwCtb2UCaOscruzTlIF5tu4n/pB7qfbQnw512y3WlpFW1siqu
	 wu13FLnMLbGNtxacPR9+0LKq0nz0ZQ2P1JNOLbP7xwnPlpQ9HCdjKIPNlS9BwfLqjr4JQ
	 qN+sqAx+Q+cL78PDhfvEIOvMSXePHsP1940yYNkEHkhrwAZHuC8mXoRVRhQWi2Fj78vhZ
	 eYzLJTi+Rea45ZD3CYs6wbnm/sbQn4kFQtOz4h+VoInqeIMZmdR/3V6DZhg6foqVFaLfB
	 zNUELmlKqc68bu5Wc+DeQjVSUycXAQOjUtNPJ/25zxI6HF2whgGicuOKxueoH86GkAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UR3wX3+R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD2606A329;
	Wed, 25 Nov 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UR3wX3+R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA901F00A19;
	Wed, 25 Nov 2026 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611208;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UR3wX3+R31Qc//jFchBzNaPAHOzs67bliCMK27jICgwR0OXQqgPuSAODup7+IqtvP
	 aHZidQaso+zCrflmgK86esVX8mA6X6bSYgWmRZvrmtdAKfCKM+WaYWdVGGklw3UXtG
	 3Co/A/lSrPME59i1dboplu0LpB3r+xi/Yls07vQldDePZIwQ4u96G9YnX4IFiIlO4y
	 LGjGb8r1ixC6uQzlmfFTt58ZZb3y1RCpQN2lv5LbYPmjX8+ppSrqR4UJdXjKuPnrN7
	 ugUJ4e3xLmRlxCekLnsVXXvF3Avh/4cvHw5gmFO6d3w/us9GjsOO+PjECSfrTFV3IQ
	 Z2vK9fLPAtlbw==
From: netdev-bot+sinfo@kernel.org
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: xxx@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tcp: fix spurious RST when SYN_RECV race is lost
Date: Wed, 25 Nov 2026 12:53:27 +0000
Message-ID: <179561120730.3294.12023020762680207810@kernel.org>
In-Reply-To: <20261125124653.289409-1-jiayuan.chen@linux.dev>
References: <20261125124653.289409-1-jiayuan.chen@linux.dev>
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
