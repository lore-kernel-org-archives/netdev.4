Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691926;
	b=jsSkGdEkiqWaNpLQI6xkaKM1LbA06GhC+fWQL35ScPSc03UGrOWLojC0gF/6vDmLOkH2
	 aXCa0fzIrIpdaO2kPzm8Do+yrXUiwzJsX0+3ciy4bDnnFTkGaBDY7+GBHEs1h4O3gFBLw
	 A7tDFHip6NXvVYHMS35TGd+OK/8D1eGZtF90Jm9fYXAu6ds++x6oak5Nx2MyLga56nAos
	 g9HouHBHrNzMjbvnOFsNhYY2+SLEEUnMNFexm7pNbWLgR6LEjhUDdER7ab0vlg7ajY1NE
	 XBO0ZiJtorb41uumIA732Uy/oFYZ41lKX1faDsIfT7b8K4Z6P7DtY2eCT5399GaPzvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691926;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=1S7vBK7pgasVV0LuObHz+Wk8fTu6JESAdZEtTR47MJnCQH5+jllyE4i+HWejS/nrMeTJ
	 2E5IZ3HodkLfSJ2g+XIQkC/BWm/FK1XyPWDTpsUuqBWOnJxJPuk7EbVPYUxWS2/9xRP0E
	 AoBaC/DS1YwEZMPp5SEryOvN35DARPwQMqk6cVji/yUqtFjctqXF5QID/IV+iZ68uiSKF
	 UqnaVhulRpEDAK/aFP+QT/lCzpl6A1c9Sdgb6mz8o0MfQ0ik8TzEHWcBkbLRic/E6QPH/
	 KvgGkq+jRrABBX+VHrTO46Lsy09/KeYwnTnYe1LENni0Vzgdg6QxHg5hUM2628DPpkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gU3e17il;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9AE606A31E;
	Thu, 26 Nov 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gU3e17il
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3690E1F000EB;
	Thu, 26 Nov 2026 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691925;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gU3e17ilMidRHk7C4h2VrOrO36TZvBVmlQElAVFpd7or1VTRARa2Te37ez2bUJmgu
	 X/kkyADMC8y9DU7MrbPB6Ungn6qlQ/fw4+AcS/cjXj904jlqbhXaIMXmxIaU9VqZmh
	 S+C+LXsB0Uv2VLOge8rtT/DCZJGZrHMVvHN2rN5YTVWcE5BisdUx2fwID+6FvRpEBD
	 Y25YzJ3hyY+u+CSPWDP2ZvsxXgmAXQuC7yTKw3p9KrKyUn0C/ADTsaG4J5t0nYU/PV
	 7hTK7fBSO2J/uXw1hqGXA0itFF3r50b92yfnm1k4GwSd7S3WNrZjkeQ/KDRP21khsP
	 Pvtz7c6maQ7jQ==
From: netdev-bot+sinfo@kernel.org
To: Ralf Lici <ralf@mandelbit.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: advance the route generation when policies
 are removed
Date: Thu, 26 Nov 2026 11:18:44 +0000
Message-ID: <179569192472.3294.16207945676550617931@kernel.org>
In-Reply-To: <20261126111516.317545-1-ralf@mandelbit.com>
References: <20261126111516.317545-1-ralf@mandelbit.com>
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
