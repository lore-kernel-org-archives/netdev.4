Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307341;
	b=zxpw9mgqG4pAD+eTdZlVBFtG52HPf2PebuBW6Y/iqwPE8BqwnP3z0Cg7a+0Oh+HJI9dH
	 swxJYJ8y4XQI/1949eqWEGc793mdS0IpnVw7qs4QBhwZB8tJuDaybnywMD+ND9LQvXQyD
	 EHOzGv+WH0EFvJVRUhNXZBefuRNXKFGa46u16n1ujl+RycnFbpOhoM/0mbDEwh6VPkJ7+
	 XNJBiUVjD3TVoE4NXnTJ1gXNCViYPOAuNgL0ix6DXgCPaWeavy3X2RMs8rU2A6A1wdWLA
	 SBxzulxVyuOP/hpLao1uz09FnbQ6UbWKq1GCWuzuZ8eE+PP9p+0pQDGuG6n8lobnOKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307341;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=89c9O/yAKJRdizL+0JjVNDt8ds8ZNxXapQLM6WrXSJo=;
	b=D13PYVhSeUHjfIasH+Jl70CxXUPBaw0YEiaz5VvVbVJpstW254NQN5RVgF6Om3uMBtQJ
	 O8bedvnzufpbJe9ZBS/wI7/xp/Mm5RFffr5AMW7ljYxINjby+w0ZleBkY7Q6ld3+FgE4P
	 oueUdKkjP8iTkyvva5mXK2CqPMP50jGg4jADlpLLB30XCcUMz+91+aGibxfIQKAbtkpjc
	 yDYKPefWEyTsvDZmGNCqz4nF0QOCz33Car5OJevp/OdE3CEGIFXSvHlFIKWWKWHW52Pvh
	 uuaZ4TcTYzjCEffZ0tFh1Zfs088mTncqEjFkxfnry83tz+6sXAVSdYVJOsPU9Rq0qvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZ55sfqw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E943606A338
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZ55sfqw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2B41F000C0;
	Sun, 22 Nov 2026 00:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795307340;
	bh=89c9O/yAKJRdizL+0JjVNDt8ds8ZNxXapQLM6WrXSJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kZ55sfqwCaLPWjQIuuXDWbwCt4EM1BQtUrfE3YsBanoCQqIXzZUxtMAJOaHcNYYAS
	 AxzQrtzKacYeaGNReBD+XWWaFTICpPRJJiN2UTq3DpP3iMYfm0zkHW0GPAdMj3iPwA
	 fUi1CD6SBr9OIoYT8Yn2CvHKBEK8Mkz5/YrchG4fUHpzz9K473Ma22vPacZ58aXQSY
	 oafPScAQKdtOMkMAPCqjpCUa7dVqna4RWWDYnYCuvIW11qYqSMwqXrXXkKg2Fj63YG
	 jPQa9Y8sRS+TTb8iSwpnqXzZn4EvAfrIZetww6Br83fp6oahtfnOfYu5cZbWaG2tV8
	 yb6/4swbS6iDQ==
Date: Sat, 21 Nov 2026 16:28:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>, Petr Oros <poros@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Magnus Karlsson
 <magnus.karlsson@gmail.com>, <netdev@vger.kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, <edumazet@kernel.org>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Marcin Szycik
 <marcin.szycik@linux.intel.com>, Aleksandr Loktionov
 <aleksandr.loktionov@intel.com>, <intel-wired-lan@lists.osuosl.org>
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
Message-ID: <20261121162859.3522ab89@kernel.org>
In-Reply-To: <fe1ce4cf-3400-4a87-8e46-072563f8fe9d@intel.com>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
	<20261118115915.116177-1-poros@redhat.com>
	<CAJ8uoz0MMUx68rMZWoZs-JwjodpRixwQSrgpyta1NsanGPn=dg@mail.gmail.com>
	<av2syi6lE/Vp86QW@boxer>
	<f7f1ae2d-a623-4eb7-a178-c618316beaf5@redhat.com>
	<0bb65ff3-2e27-4f2e-aaa3-2b8eb7cda356@intel.com>
	<fe1ce4cf-3400-4a87-8e46-072563f8fe9d@intel.com>
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

On Thu, 19 Nov 2026 10:07:10 -0800 Tony Nguyen wrote:
> An idea, but this would still increase the queue for netdev, would be a 
> separate budget for non-Intel authored patches. This would allow 
> community patches to continue flowing without being blocked by Intel work.

No extra patch budget will be provided.

As I think I mentioned multiple times netdev maintainers are happy to
take patches directly. My understanding is that it's Intel that wants
to feed the patches thru their internal QA and have the ability to work
on timelines, let's just say, different than netdev works on.

We wait for an ack/review of a maintainer, from Intel such acks never
come. Przemek / Tony can start acking things directly on netdev.
You can also add another maintainer to your entry, or split it up
and designate even more people.

IOW I agree that the Intel process feels dated, and life would be
easier if Intel switched to an upstream first process.
