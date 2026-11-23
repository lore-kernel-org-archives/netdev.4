Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466834;
	b=oVe668VyOM3+iKJKve4+QA42B2lfQGs9xXSvDarhmgVnhwC4Ljo3NiXDx98xggdSBllx
	 n4d3XlXCuKYHXIjb2W/KHHKmgU3Qa5rcpMmEkww+PeKQw34+4TG1dz6QX9eSCijvv9ShC
	 orBETTTkFrpPTsa/4z7peImYWLoCyQVunOli8vt2O5abeJowNIAMUeetjdfNHEyjowbBS
	 alMKxVXVcf99OxkxPx4f1woNziNP6idHwrk0HuZf6mLrT+sw6HcG/zX9DQdVn/9U2nTdL
	 cRfOSTwacL5FLByLfacnYdOH+oAae2YWjF2dh+bVNE2igOsOSppOhDS0m1HE24xVqBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466834;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=cVr9CvCfaY6crDqi2W8mLXD/jLDxwe2pLyUCLOkkIV2CyrtzNsd2FCl+sx3BZ/Zlpu0X
	 S3yOd577MdVFJTzk9YzAXqYQIwYXON3N4+fxVreHLIMb/t+xWBI7NCrboLAQv8iG1unsF
	 euHB+13sLPoWspLJAJki6hGMNtTLlzcdth6AbgShz5cf7yDnaC55u2EOfYGMIneGfbDjD
	 zDwPZcGT9RV6kh/kiExDuewA+W/Kf8JzN16Bxru7/CwlSmO2Cw8JcBUYDQbFaoVaVRnhW
	 lllHt95JngXS4JSCLpF4uFGxvGyo+wUp+A/gAm47kfxKhKhreMcEFRJfb6k5K5dWXxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UruE3yZi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD66606A321;
	Mon, 23 Nov 2026 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UruE3yZi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351851F000C0;
	Mon, 23 Nov 2026 20:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466833;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UruE3yZiYMf4wPtABxAm7ydyUDi2e15/I5Pse5AI2RMc4UKuVxSXbuTxDtXfcADAg
	 si9DXDKJIkjZ6xV+2VrUME80LIhbH0Q9YfrRDoymjtBjumS3pguTxGCHx5jiYy4WTU
	 3nluY3n7+ndDjt7SQq+FqKg3oMjBC+fYGelbxHn51Hc/T/VQQY48WyilPUzQZZDrfl
	 QjPYlus21H1eRka6xeR9lDATwYiD2Kz7l6NP9WjJvcTOc+ntnArCK14UAsNHINPXGD
	 aU56btEfEEypZnX3jb2WV0nsXbSzfr/h9qUOWEeUNXNOHi3M/dFFRWJQ8duPYkDll2
	 R/lK4/wBsDG9Q==
From: netdev-bot+sinfo@kernel.org
To: Mani Tofigh <mt4022@columbia.edu>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Martin Karsten <mkarsten@uwaterloo.ca>,
 Joe Damato <joe@dama.to>, Dragos Tatulea <dtatulea@nvidia.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Cosmin Ratiu <cratiu@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Wang Zhan <wang.zhan@smartx.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, tz2294@columbia.edu
Subject: 
 Re: [PATCH net v2] net: don't leave napi->timer queued when deleting a napi
Date: Mon, 23 Nov 2026 20:47:11 +0000
Message-ID: <179546683171.3294.6057882042843846314@kernel.org>
In-Reply-To: <20261123-napi-timer-cancel-v2-1-00e6fc1be30f@columbia.edu>
References: <20261123-napi-timer-cancel-v2-1-00e6fc1be30f@columbia.edu>
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
