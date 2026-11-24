Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531939;
	b=Y14u4Mv9kBoRxlVH4/HneHS632cI9/NwghrsukJBC3Z4yseiHFbkDZx2eoa/Lylku1h2
	 jbKb9TAwWa++Lm1yvAQw0AZehc8+zLzuGKhj2iMw4oUryBxq3dYf8z62hud0nAjFFfvFj
	 WJFllMBo4Rth3YqXv4vvqkucBbuGNO5ErjZDdDz5+hxCmdmntIHtGL8/cwumJmoHAMGdq
	 56vGzM9W1tPu3XtQlWvgd9PIxQWyLUDJHZT/VYmqLRQJz0gwi6yzcoq8mLgIlxfiZuIDO
	 lL89mlEojO8LcYADfqVZexE9Bk9d0DBjFLOT2DlUnbEfZlYG4IVX+erJOGNKVO6INtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531939;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=ir8r/DdPbBDChwKt9EzTpfDH4Fv+1sx4PRU3oksokh853k9AGsHIHf6ghjq3maIS10QQ
	 RAgpLbeCDJqWt2H6kqUX7+0A1RCkwlGuFyuMmmTl8Y4IHhsjDv/CHPgLO8SXNXDy0M+8A
	 /4YssheRekJumvOn+Uv1XUD3XnfwPvuzcgXG6KCLorgnQL7n4+0ggLApGfTuuzSF+WStu
	 MYrPjR0TuVM3DDe9p4VQpoC40ZWX/3NMFJacXl9PIGJnllIy3w1WGdTDWd20IXTBGg74x
	 0EE2hULt5J8s6QLf2PtvgNJBUvaEoxLo/reHv4JWqHBOYxAk9UPtQPvIU5/Dt05Lhyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbBmCLFn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31934606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbBmCLFn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB611F000D0;
	Tue, 24 Nov 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531938;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PbBmCLFnC+pd32TunHK8o/mjKwQadDLqO7HG2hiWAocPcMTKJ5BRqLeAotTEIRPHY
	 PNynMEdWj7SfaF4l28JA2myvP7QG/SqWf277vTuxPptY/8S7RPbcrFBm5nmZGVF6aq
	 FvPS25OJRxws4yygEc0UTB5M2vh2XppxfDV+AGIfUSVuaoQf7SLnXwlEmUdtPRQMRN
	 0XyaW9/OE+ZTSn/ivkpQdXz1asWTIM9yFf5AI+u+11F9DuH5b4BxYM6oFBuOwA7GSC
	 ldInYAlHRdfdHV3HMr/Cd1dg9q5V/CR0tJvusOseSjrrvH4LjVrVpryG2j3NzRJcuQ
	 PmI7aLsy1krnA==
From: netdev-bot+sinfo@kernel.org
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, dev@openvswitch.org, aconole@redhat.com,
 echaudro@redhat.com, i.maximets@ovn.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 matttbe@kernel.org, shuah@kernel.org, netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net v6 0/3] net: openvswitch: fix a feature leak on a
 failed change
Date: Tue, 24 Nov 2026 14:52:17 +0000
Message-ID: <179553193708.3294.13977466604609033873@kernel.org>
In-Reply-To: <20261124145033.627044-1-houminxi@gmail.com>
References: <20261124145033.627044-1-houminxi@gmail.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
