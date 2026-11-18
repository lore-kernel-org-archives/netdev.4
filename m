Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976341;
	b=wnCrko0xfRrTntOK45sswwoPeIZ/gm011U3IHsFMUKcWxy530iDqnrkLGnmzeV7cf589
	 jfdjhQrf1+LyEGRQs1glcItt9zwr2DXcvQeR83kq0CSY4qFumNEuJ+Mijc1kbS99lTKyj
	 sU4ZqDEHh6kUfEGs6xOOR89wriFtDGK+ZmG7NV4uQGL1C6LSzxlvy1UhyWgpyW+JX412+
	 3fm00YX2Ra1rrIyvqAC/iphBZIscpVeRaGht7Z3FmAydPUbbV86PFcSpYp8GrWhgy8d72
	 dzZJEeAL908uiPGpv+9SfqhYuWw71S94wOlXX/FRy9nlS5MkgV5GikWnlj8LpaVUl0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976341;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=l7+/kO9ciPKpG5AWlyv1pHHf/zMpgK8YG0KvTGW63cw80sTZnSwj6UusCIEj1OOq9fU1
	 Py5YpVOGInhkP8+QPjoMyLdBQrbe+82Z1I5EqC4khGLq6Aq8CqroStRzjCmhhEsYRcsB5
	 q64B0beyiGi/qi3AWnwUn+C9Zwupmc71xgmV8/qDM8K82p6wt/hbw9nuwGHiLP9HfYE0X
	 ILAhM7VNcOEpj3aQdbORa0WyvCpL3H0c8lodvmF4zdXuP4QwCey2JRbevXK4pEWYyzsI/
	 NyC9wVtXC6/ydhLRAB2VLOjpADX0wpsflQoigNGZq3rzL4h3OkxonVrkdfw11VJfmNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRDwkTyV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0141D606A31C;
	Wed, 18 Nov 2026 04:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRDwkTyV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E022A1F000C4;
	Wed, 18 Nov 2026 04:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794976340;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VRDwkTyV5Lz564Kt5XTjr5Ye2BuHPYteMAp4HbhG74daZA0S52kvoWV2G/21lTqgQ
	 zGkgmuJN841NS5sRZ/Tc/yonKbIMBJskvsRs8xArGJWD0ZIx6BqxdI0b+vWavNJfwW
	 qAGleYI70hxGSI3V+BfDY9fRAPr+Jej9kJdBnakFi+MAwxEGsu8snPK9PsQ81ZG4Mi
	 6O3lORLU4fwPDTz3Oal2ivLCwomXV9L9j0Y5Se+Wt4Fj7dutQMoEaUV7hzty1iJybs
	 mRTNF5R1QMxsWDwqb4Q/eolcVMsyZmSl9cReCyODv5sibmkDMxG/+ZrJytSJRWk13l
	 EYxq5m19SNZCQ==
From: netdev-bot+sinfo@kernel.org
To: Vadluri Mukunda <vmukunda@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sunil Goutham <sgoutham@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Satha Rao <skoteshwar@marvell.com>
Subject: 
 Re: [PATCH net v2] octeontx2-af: widen TX scheduler queue index to 11 bits
Date: Wed, 18 Nov 2026 04:32:19 +0000
Message-ID: <179497633943.3291.2316111329843445941@kernel.org>
In-Reply-To: <20261118042614.878448-1-vmukunda@marvell.com>
References: <20261118042614.878448-1-vmukunda@marvell.com>
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
