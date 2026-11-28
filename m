Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834143;
	b=lTZS007jRK4rsfJSrkJLFsSl2BpmxrincgM19zW6uj3n/XvplK81wDMHk0YfHVqeLhz5
	 gztzAMbUR9f3YrUMkX9YVwI2B5jhFiYrHlkfQHQKaB7urOAoSdmu6ReXPKnyxUwRQW+vr
	 HsnavKipASLlyvXwsLplI7zW5AIeesq5Z3Djlk3GqEeJzBq7SCvo09VzJuH3VNDQgV6Jt
	 JHG4weXxBG+W2rmmOaDZffeYRmg1Okli1vbSIdhlvTWL0PUfUkuBtMFYJ29D8QL27S8Z9
	 +duHHy64fMzdMLw2PrjNreCObuCdGkLzW5xK7ICqnZk3Euqy5rBSpABJ0hdt0n9xvPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834143;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=xas9FA6wNWiEEs1jZWu9bTF3oM+T99OrTwNI3A9FolVhwA5GBqdPQo4P3a2cdcwsYWpM
	 wh5rjeBm0WPZYjmlAx16fp5CaaKVzpzCd0Vf5lUPNOFtzi+0zAomfwCvZINTiiIMrMgj2
	 F04fCWOBfRknZLx2iMhfHZ4TesF1Ds1q6v0RvLkOf9tzXd/0AKcHJao9UYaH47A9Kt5Xv
	 j++KbnPBmUrDEzzdAMeNJu1lrH9k8Z9N6oX3pquFFRJPkeUNqtMZVJzzP18ybTo6wPgt2
	 r4xXlpK6f/hVY5tjwFxf7twijKvueQO+pZAYx4cHdSSgiJt/+a+nAGcXOgUmbfJORcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HM0NttcE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6F606A31C;
	Sat, 28 Nov 2026 02:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HM0NttcE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDF01F000C1;
	Sat, 28 Nov 2026 02:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795834143;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HM0NttcE1I3Tk6dqrEOCBJAgcHZt03OFH9YBqJ2uNEfCqQoLvFdHl5h5OOMZFOtJj
	 R5gQzAmFhAacWBfjLla+Pl2JV7VPqnRiFx8wqWGVze2ojcJHwd3G+DHQNsO/jcQpdR
	 JNNI8L62efhWrYfFxYF5fDQUEhj2L/wWtcpvkWMLslu5UDAufxMaLf3nJ0L4qTvCAV
	 kf84Kh9cGLRyFS26X68aFA+2B/vkmnVPLAKFt62Lp4btcKYcyxnzT39T98ywc/uC3b
	 Q8YWB9C1iktVZZevHyeWrlnd3qsP7bRCMu9A+AumiGo+vjRkt6wtYZyignqrG2i2jB
	 ELAWw8ij58asA==
From: netdev-bot+sinfo@kernel.org
To: Lin Ma <linma@zju.edu.cn>
Cc: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] rxrpc: Fix NULL Tx buffer handling in the
 retransmission path
Date: Sat, 28 Nov 2026 02:49:02 +0000
Message-ID: <179583414227.3294.16637079240756481479@kernel.org>
In-Reply-To: <20261128024427.306409-1-linma@zju.edu.cn>
References: <20261128024427.306409-1-linma@zju.edu.cn>
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
