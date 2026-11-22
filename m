Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307560;
	b=EQHex46DBzlbZBV7RkPGYMIDJCdbWGbqdFwZVsShO58lSh0R27ySu3yqcTrpmj/p3nd7
	 h13azMYvqBy+7779fNVmuAIKDnj7rrZ2qXHyXLCT/rhA20HB7qiCfulX4clf+2JU3UT+C
	 E8maui8JzN2hATZJSdtEnqZ/urqTu1ZnH71n1yXcNnr7zgMYWnoUC7++71bvncTFHzsxl
	 IGlqcaxVsf6ybGuXdl8lEN6zFICAVnlx2MQ6lT6JyteTV5gcZc4NM1x9U/Di4LQR3xkt9
	 gDEYuXEeMhzQh4TX1WjGlrPrvU7xdgnwAM/iwkZpqzIFBcf4CHC8ky7hB4ZG0G9bFag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307560;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=GRqNi5zfeGpbQPU41L0XqPUE9yiCBG6Ug3sFVYTR+iKHxeil08D5cT8tJKDdbn/xldg7
	 boemIsZnApgB6jTBlGYdqZtgF4TUA1mOPSMY3/mIZkcfVYWUXRUv+9xyVHnumgn3KG2XN
	 MDq7sYv0dM+kOKCO7lFZHWpsOhqSGuaC6HSgoUvJ9ofB2GbpMYRmZQhICGd9rgSnYInzf
	 Nd5dbFDhnyecqannt15VCxWIz8ocV2qdSLgafP1dp67HH+XlSumnIRd9/FIaU8s6bh/pw
	 DoeMK87YA6ovZ+OlIZs4bO04kIJYk3XH1e2QXe8VDQP5je6dYHvrJhdWYnMLEr7+wMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i325Q51m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051ED606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i325Q51m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694911F000C4;
	Sun, 22 Nov 2026 00:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795307559;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i325Q51mFklCyeFIZkQcHJpRKaTTvJqQ9WY6t8Pq0DwHyAAeDDfnxvNjw0wgeNQvi
	 8H/+craxErwukrN6STyTKJBe9cGpz4ZfGICxDCMCvESODHyswJBcReUpGmr0azywYx
	 kUrbl5Bh9gmrGUVuc/97EhZmdStXG0iZ8Hb4bgizyXQlmUMUiNNBNMzNSVva1Ffx70
	 zQTUsT3Xtd5itc8M7QG1wogJJD1Yk7cC0JFxVwkmtmBzdK1CFI1YRP3lq3Zr7pISBn
	 ApSbHP+um8Ix6a8Sw8EIAHvAW9EBrYELdPR/oRxq7/syS7iasj2O9J1GdAjAz3M6t7
	 XxpFbsmZkyBRw==
From: netdev-bot+sinfo@kernel.org
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: zero hw address entries on allocation
Date: Sun, 22 Nov 2026 00:32:38 +0000
Message-ID: <179530755896.3294.9774209097444302196@kernel.org>
In-Reply-To: <20261122002633.584362-1-yuyanghuang@google.com>
References: <20261122002633.584362-1-yuyanghuang@google.com>
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
