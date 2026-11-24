Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523887;
	b=C7lk3/WtmnmokPj4eCkLWNlDf/2+2KGtwc5W8lOYnKRSPJncKNCSEf/7jXcNBpjm9FOC
	 rvFmDEddNvQk6daAAzq6nZaG9COwxelUMr7LOXDQJ5EZ8sUDP9AH7OC5jm9fcNUd5hUvm
	 AxfBGT+x4nC0A1wyJG1r+cl9XkYL0h4mKZA18LN2N7LInUmDCJ17BSybC6GL1sfNqkD5s
	 u8oe8tHbE2NjNN2J3U6n7P4681Tey/evdcN0U/tD8GycPAL7ne3709RV90FNvXMiVNrji
	 dFqvj+CRDH25GFTK6LQw1XPDUmbEdz5SpXEjyQqFSFvs4kWQoqdR03SQPXtIJAE/0cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523887;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=sGQWHvfvNuR4bDcafpCJrAsVYXAgtgvxZYv6zee4x7SsMj6SyIwEHlIu97ppO86/Wxct
	 OcVVhFRJKFfgktYjDNFk3gDhNmdcBtaZBotoQThJV2AgLqWAuPSyjz4Cc340Km+GuJ6IY
	 8vnA25faWO4aek/SpRoY7NZULZVBDvxZ1GodLDSL5aYEoJ+4K5XsRIbbg0DhJG6lXNmK+
	 yRS3N+5EqVCFHfRR4VBR9cv8uRJXq3I6gl0QwD80ed/1rGxS32YZsfpd2dFMRRpBX6Mma
	 sz/60df3dYwwYoUf2+FrZc437tksudmJfl07XoDjRlMMCTo8xF1pMb7ze2qRkkbP92g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2IRfZkb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05635606A31E;
	Tue, 24 Nov 2026 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2IRfZkb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1931E1F000C6;
	Tue, 24 Nov 2026 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523886;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m2IRfZkbevR2dQCYVTzfY+xTtZIikKF1nJQVqzV8G2zJbdGdOkyRwt7Fnn8hcnGKo
	 79sOajCbX6w6Tq0kZ3N447flt3Byp2AjW6bHGzclsCCKgtdbDQrdJGH8mef4j2sZKy
	 niwhgZz7/INN7LunfFuAocJWa58bdroj2t2KugbOAOvyQqOH6mMRn0kMYZsaTiVzGQ
	 zAM1Rk8M9oFTJTb3xWP5GYxRIyeEQkUDf+2SSpr+CW5heJQt0NSQQk4erPrfDvt09x
	 LTevUAzIu6uk+aJ+q6SscUUWqZbuKtdRNvuzj/2MSj96E+2ZbVwxeukWMlFU95unMf
	 +ZxcQc6LdXSVQ==
From: netdev-bot+sinfo@kernel.org
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH net-next] bonding: roll back fail_over_mac if enslave fails
Date: Tue, 24 Nov 2026 12:38:05 +0000
Message-ID: <179552388563.3294.14587394953378202358@kernel.org>
In-Reply-To: <20261124-bond_fail_over_mac-v1-1-9caee319331f@kylinos.cn>
References: <20261124-bond_fail_over_mac-v1-1-9caee319331f@kylinos.cn>
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
