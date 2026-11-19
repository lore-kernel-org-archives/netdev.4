Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052861;
	b=5pzGWrrJoTor4Ge28FEA9CZfx7KZlc5bEmjJavuSWJScch0i0yqYVl3woQjseXwjQoi6
	 4AMAHenhIhWl8QkfwJv8kqp9psFBirD8FtJCDBnYGK1cbN7CZh/G6ORx7e7r/1Dd9eYA7
	 /titw3NJnEvh8sTNKtAL7q0SeW2ohPe8MO4zcTwv38H4Ms+hQheYDQlu/2JyzQKq7m+Ro
	 mePuLwALzWtgACfy74j1LS7o2DQkhSDW2o0geIX7odoMj/1GFz4QNAyJeGSikLUU+QNeK
	 M63G4aEVHbUdlNY/+VibbmeKfwtZVel4iND3DJANNXfAMDllzP+YT17N/qotjjDgQdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052861;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=etIsZPUKiQOgnaTxQQL9Wq8lQ8t2eKQW8Swl5Q0HUVE=;
	b=2Fj5V/Bzm4Wa3s3XGXLMV8/hHsmK9ppNM40TEn2mOMol9glOw7ThOun9KbI57aZ/HNbS
	 ypgjAE9eGcMJRd+B0+U1MNYEBTO9xAoGqBp4J224TSNSVGPYuIJOrSjRVHfN9NKta+TPS
	 vxXt2BCnnGDIJJYEqj72wK+v/kWLu2PDVt9e57lcNSwg9sgiauFJUA97epEqWCwuAxC6c
	 t7YgyeephVjS3oNqQRdVbB0xzffLmkJ/tiVQDMhIGocW4TRY5x4P/QVNWndkE8cpNrYkB
	 ZwcYmbAVnY2ZGxkGGosgq4IjoV0cmHoj8/7aChbLTiVsr3rpehadtIjASLUhIVQr/Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a84JPg3e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C8606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a84JPg3e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB9C1F000C4;
	Thu, 19 Nov 2026 01:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795052860;
	bh=etIsZPUKiQOgnaTxQQL9Wq8lQ8t2eKQW8Swl5Q0HUVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=a84JPg3ePCsR0+TTG3WuvKkgLJ2xWd/Hb5NNGoVySuqMcHJUYeRFljRb7OO4U1ri4
	 0FSM3dsDNyQA0tMWo/tPyjwAVggrgB1F2IkAUm31dvD0PAc7nvZnRSnlmFFB5fzqHc
	 BZSKBviSY61h4bLibU0RTeFZdtg3e7/U9frWx3DM/BmLezN8gqJH3Hu8P06L9LsV3v
	 M8HR0d+yTMM+pgCudsihy6swQ+J5Lf3ux65eEIN8jhAZtOmh+fG9difQrIJymspe1u
	 n2IFGnlJQgK68muRzjCkpwP/htyrOLcn4lYpO7msx0aoH+cHVSz7/fV8AGBf186ZDu
	 AjxQiOcVsJNHg==
Date: Wed, 18 Nov 2026 17:47:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <edumazet@kernel.org>,
 <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, <skunkolee@gmail.com>,
 <luoxuanqiang@kylinos.cn>, <nsvatoslav515@gmail.com>
Subject: Re: [PATCH net 0/3][pull request] Intel Wired LAN Driver Updates
 2026-11-12 (e1000e, igb, igbvf, e1000)
Message-ID: <20261118174739.61e7749c@kernel.org>
In-Reply-To: <a67050e0-ba9e-41a8-acc9-2acb0b713ebd@intel.com>
References: <20261113005823.130021-1-anthony.l.nguyen@intel.com>
	<a67050e0-ba9e-41a8-acc9-2acb0b713ebd@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 15:25:46 -0800 Tony Nguyen wrote:
> On 11/12/2026 4:58 PM, Tony Nguyen wrote:
> > Ivy Lopez corrects NVM read on e1000e which was not properly checking
> > the high word's modified flag.
> > 
> > Xuanqiang Luo fixes igb and igbvf device removal by disabling watchdog and
> > reset work to prevent work from being queued after cancellation.
> > 
> > Svyatoslav Nikolenko resolves an e1000 probe failure warning by checking
> > that the CE4100 MDIO mapping is non-NULL before calling iounmap().  
> 
> It looks like the cover didn't make it to the list [1], presumably, due 
> to the Outlook outage. Did you want me to resend the series?

Oh missed this, since it wasn't threaded, sorry!
FWIW I decided to toss the first patch since our AI says it can't happen
and the commit msg read like a AI report/hallucination.
