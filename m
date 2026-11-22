Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795356204;
	b=hvneyGKiE4JuYW/KeXgn6aJW2K5WK1m2t+PYghkFB/U0HwrE/eUk4+2gIi0cKN4/Sxsw
	 ZjRqDw3l/L/TTZh7KHO2xzg5O3aV6OBxXzn6lxHWnuvMsIZHCId2Jyl86kaRHiFzv9W7C
	 ShpsZlKKDW6Xrfb96R9+WmCPEmnviab/0IdFMMBAoKyyrP8uIcz292KWixqkFAKK5vgRO
	 XSKus7MFqBd7a7blw4PReISca6D3uHEu+EcHbqcGmavBaT0HDjsGe+lPv9R72QEQkrozs
	 0W19O4Hq5kVooiaFSHcWewz6z9/stjms3KClQNBL2K5Rof81xdPJOEp6+HRYPgYg+mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356204;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=tPkvPtTnZ7yUYFkhkKUHbsXEJ66aw2oQsHa7GwS9Kw5zolBma1dS/MPvTc6k+170u3Do
	 xMXWRVDaDjcAjCfrNNO9/sMqBS0CuFqSPPY36ktcJmfwHIl6JSL3h99iN/jhUwnyzcnJU
	 7ZG9LWa0MRaerW47PztICU2pVmQdgSvQkAUoC3nnUuCs7iB9WoUa0yHnRiCb3r5b/0nBm
	 FMJ3ku+qputWmq6zfxPhsdYvc0/Tc+yYo8mID+0t2Ud/BxovaQMCoX2+F09RGoe3FUNDP
	 Im6e+73R2g/sfNd5+L4knkV1QZFafJPfHfM/gnQo/1ETXtTzMiQRVQck4yYIbatk2Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjhFeBKv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5B606A320;
	Sun, 22 Nov 2026 14:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjhFeBKv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC7D1F000C0;
	Sun, 22 Nov 2026 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795356204;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EjhFeBKvtBcSHu4M/79q2RZ038akiLmMscbvr+LGjYVaMuAmGmum/4Ad9yX9zuCXs
	 p1akSiCq2O1TrRY1C7Sw5EqMd9HLIUYEkrVfeHk9VBbDwryouSSJULPqghT21DPOr+
	 sXUzfDonTVGIPE0HgPax7Z3450NIEYB6FCdZso8gx7bUsZmaa1JuC3CYLXFMRI6jcu
	 MH4F3IPlgcqzWtmMvIa28GFJ6qswJvgVoaoNiWenrwCb49cAzwOOKyQWN7HVI8Sr4m
	 GXEZw3Z84tX672CBVnoVe8xHBO6rV8tOt4v+DJZCTAOzTFEZgfdvCT4DDkHOwYeGNJ
	 RDXS06MrU/7HA==
From: netdev-bot+sinfo@kernel.org
To: Lin Ma <linma@zju.edu.cn>
Cc: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] rxrpc: Fix missing lower bound in rxrpc_resend_tlp()
Date: Sun, 22 Nov 2026 14:03:23 +0000
Message-ID: <179535620364.3294.15218868114054377349@kernel.org>
In-Reply-To: <20261122135515.3989708-1-linma@zju.edu.cn>
References: <20261122135515.3989708-1-linma@zju.edu.cn>
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
