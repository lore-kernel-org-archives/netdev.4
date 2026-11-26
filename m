Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692766;
	b=AomVdxZfkLcYn9v6GnBHS3t85VOQfPZ9xubGa6mYlMNyG2aZatE+pvuUxP2CkwMPNm8U
	 j2GK0c4bl4A91q7jJCxKLDOQp9pI6vmhJ73ECLCCaRBDrPrk+KhXl31GjVGtqg10t74J2
	 qzIvOWR0gwpqX09u5upIMauQb3iqr5lKKus50rt7MtY5l/+HQi9iPZ12B0L0Z1nP3CaBv
	 HgqhtaqzmcRu0QJ+VuKkLxUHKRiohaz6aSYhhvSWtTWDnIKGu2gHsFvIOzN55cKSyIlyB
	 u3qEdspsAlpmgp6/0Uy1Wjksc4IuuU2jHTtmmepjj1Y+p0OJ+bCUgeuAe9izVE7hrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692766;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=s8z/S34sm6MqiwlMDg/8YJMASYsyM/tn0GLAt0xwxdDmznSSkSmOmc8BnfP/iwKXqUWC
	 RWldT83cPeYB+qiuRuYUXMI/o7IudFCG/2ygnomfcIkx+krLTIOo3kHC+O1si8lb5BvIK
	 kEt0uBGuevoROUtWT4gUGCawTYYXjkpSpvx5fzAuKvF4sYz1F5tPvnyrC3qTUuFRUqQUj
	 DmZnhMGXJGl41BkWMOvDTb2Vvs5IqlCssQBzbRHygfezgqbnVMnS9l9YBB+aEzrFy2oaj
	 ZvOqDEwxrKuZhrsP8yEXP2HNllPYaYLgSow7WFXYSY3egEK0/aAEbe0BASISUXDeddQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8DX40o0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC1606A32C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8DX40o0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A041D1F000EB;
	Thu, 26 Nov 2026 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692766;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m8DX40o0BSBifgIuFB2mUV9WF/7hK3UvHx//itulVJiE1A/HgoecQMpo6LX9DtEhf
	 teDqfrhKWFk9o1gQHPVEpGQF6U4xyS5Vgaa0fc8jw/fNNdhssclIMjB8nUVl+GPLSX
	 Z7oT1OJ/WIgmLrluZQR4PpCLCzCelL58HKvAYKLtbPrqZfMLQDBm0FJA2Hu2HmjIdk
	 w1gnHjgrMWCoDTy0f/4xQ0GkDZdi7JquhI6rytzTgF3x+WkPQVKKzcK2xK4Mt2ggdf
	 0sPo0zLi5dp84AnDmN/O8HGxBDoOMWWAd7yxJoNKcW1MG+lA35Ap7jkBl3krDs0j+L
	 DrS6Y5vnqrLrw==
From: netdev-bot+sinfo@kernel.org
To: Wanhui Fu <fuwh1120@163.com>
Cc: enachman@marvell.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, serhiy.pshyk@plvision.eu,
 taras.chornyi@plvision.eu, serhiy.boiko@plvision.eu, vadym.kochan@plvision.eu,
 netdev@vger.kernel.org
Subject: Re: [PATCH] net: marvell: prestera: Add fini function under label
 err_fdb_init
Date: Thu, 26 Nov 2026 11:32:45 +0000
Message-ID: <179569276516.3294.7600196929784499290@kernel.org>
In-Reply-To: <20261126112825.3957800-1-fuwh1120@163.com>
References: <20261126112825.3957800-1-fuwh1120@163.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
