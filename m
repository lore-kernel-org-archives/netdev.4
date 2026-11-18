Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998324;
	b=1tpToipNhuG/m78LjTQbGVhdORM1L5BCzotGO690TBhVthmkCMCUzN4LDgEsa2GOr6TS
	 gon6FhifaTovuvYmsmwyinnP0rBSPw9p0I5/063aXDcY4f7XurPaKgC6BVREAaubeNTG1
	 XVvwD2slrLGQXFGC9cNSsaHouV98biHb68nG6aGIiagf+xVP8rZW99uElpWj6SCLUnn/p
	 oMR8i3HIGwZn0pkqNxYCI+orMmdNjW+mVTOYu8kdQ24z3h5ajg020fRHAsDVDGdXYtyXy
	 8bCo8d7also75K1oSIJKLcEOCTThnUamtliX7jnDbzh4EB6IVsCfgRZaiUKGtDKZZTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998324;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=C9Ffo0XZ1pfiC0CNWYLYf6BLHQgUywntpI33Vd9UKSO8yrDMo58s3m0Sr/JIDF4LYGvC
	 BFV0NQ/BWXSSwvNeyoitmVKXjAvztXCMhMBh13SzxNwduysKEvSF/IOr06uFX46aKhfx3
	 1dmN+ERo00dQB8uA4zfLcbaR8G8VIleHz+TULFXkrzp8ZGnnk3jDR+OMvh15+1Z8/JLK6
	 Il1/Kk/n2md4vs4Bj5QDYIEumLBw4hJm5MNQp7M59sXpn4QgMg/q0r8kW9my9l4KgW2mJ
	 OZj3nljSSKClZdfSRGehUIOmfQ8o+sEXJJkdeYsA+0lpE5V6WtDIfAkipxu96PeOxFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PK9o0LCp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03705606A31C;
	Wed, 18 Nov 2026 10:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PK9o0LCp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65D31F000C4;
	Wed, 18 Nov 2026 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998323;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PK9o0LCpZW6QQERHOqwu8lnwMUi51PSsHrRRoQ5FR1J0XnvkgYTkCJZunZtNp3c2w
	 ArRQNgaSxl03dOz82/jIvFtYDx/osOlF+kLf3K9FQ2DpxM7GBHwGuBOuEziXjEURIj
	 aPu39hZO/J3J/iP4XtIGacIeyvQPnd0bCBQLVYa6ylt0w5531toGQ4cO1oOM9ukEsC
	 GWTMRa99dW2t/jP8t32i+LQACV+s0D4uhHfqTpHPWP1nyyGlMmox0iRawCRXXFkSwS
	 mFT44tGy2ro3QKTOUv5f/MC1XtrUkS1BAykSm6cJSCqcn/YOD1b+q6g9a7y1ua8IZL
	 2JKlztUFMSWAQ==
From: netdev-bot+sinfo@kernel.org
To: Kimberly Morris <gy770616@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Subject: 
 Re: [PATCH net 0/2] net: phy: fix timestamping lifetime after probe failure
Date: Wed, 18 Nov 2026 10:38:42 +0000
Message-ID: <179499832232.3291.8192759477709019638@kernel.org>
In-Reply-To:
 <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
References:
 <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
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
