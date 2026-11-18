Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989927;
	b=jT2qWGisaPbssrXeySl7R002rQSItry/CQHE1Ee0k9lUST2ohjzdNvBv+liWoMe6dk4+
	 pLYqOmuYN1FQn7eFYqEoLroCCWoSmCal/b7X9paTu/WawbjI+c7UOcBulUn7WiSmqyAtA
	 Z5PswTqAGqH3L6lVUZ3vTCZXY0aKbEePOty4znXb9fPKieHL2LbLV/N/sERkdInMl/CQp
	 pqh1OhCobqS+kHLR47hU/JALuAXmPRpPI9KRoUKbfFYYD5f8zS9gnVYVIxSoyHL4fqnqk
	 6PwLCH12OJVntxNIXMJ37e/iZxrxVrrifr2W3JZbYBya4zBqIsgE0aY6Jhl72MkUHXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989927;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=HI2owRtFfsXwJaFxwGQN8hcP8IVxsrCvGm/Wcon4nQj5z2Xe5CuBdkP4INvo5NwQtypE
	 C9Y1/99oIy3lGxG6eAVUaQe1YaFW016134kXH4RLMsIqWCP6SDiET38QrVr7gwE8sis6r
	 KRC0mFoEYtPRXf3cJezgSlTQzln4OsaQbVG8EBSiU36Uw+/hfggxJibcxV49Uc0YRxJr5
	 zeYGVMED+ya68KoSpzH3DVvZSazAf5TYBWP45bJkrOGvxIGluaye4hDhiVO0hlsJbNXGl
	 m5cVBKeNiLHai/rVsTQjUce9GzNie4cnt1ZbrfajlGxnIV4ng9UhtsZvEJ8owkwYFFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZoslcJ7M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793C606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZoslcJ7M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DAA1F000C4;
	Wed, 18 Nov 2026 08:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989927;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZoslcJ7MHvXFKhgWMJ5R2bHLG9u9/iPjT7xc4EyK2TFquNyYnqw5ph2F9J88oGbyt
	 Q1jhfFX50tQwJS7taiYbIaBls+3HP26/ZeY1uac19Iu0YmIwYRIWD19Xjm/Dlua8Kr
	 5pd0MsHpAlrDTmM6KCxD+S0VkjI93fzPlQNhU7jset2yImYrbgd95qIm/pu8ITmw/n
	 rmPCyOIDw7swWklqlN41kGxf0kDAWgZIOf9kkAHgPOTMz1ypJS4Sbe9GdfOmiDj2YT
	 OHc2OfILPyUZ+dt/h4WCLaSfmgEZjFN4HxulcklODUUoP/6DbIyAxFOfZuCb5AqlWs
	 F0Tut7RmDdX9w==
From: netdev-bot+sinfo@kernel.org
To: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, hramamurthy@google.com,
 jacob.e.keller@intel.com, przemyslaw.kitszel@intel.com
Subject: Re: [PATCH net v8 0/2] net: wangxun: protect ring accesses with RCU
Date: Wed, 18 Nov 2026 08:18:45 +0000
Message-ID: <179498992591.3291.11634378826963805001@kernel.org>
In-Reply-To: <20261118081329.39551-1-mengyuanlou@net-swift.com>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
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
