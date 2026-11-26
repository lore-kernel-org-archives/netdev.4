Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703444;
	b=0jgjEtH3eEU2W1eKLIK1fuLqaWRKqZPN2fZDnf5nhmKEu+DWNiGRq82T0HFmHqHW/PXt
	 LJA7wyowPl/ze9F1TiDXFdzT29OF4QAlwDgaCh/xdCRydw9zAPrE8xCofxWbuUyE5bgSo
	 7eukCzcuYJ7nHt1nzEtyrbaGw2mwHZ4x6WogbRnhdgIDVA6be6E+3f+5tRlrRoyZ3Y733
	 TDqnTf9z44tiICixqqEhIckMvWUeTpbbkvWgsVyldM5fB9p2Ywwy9Watp7xuys9IFzrIm
	 /qC/2EgtQpUeua1jGGuyDFfcs0Wwvf3dvzERF/WlGvmrJrriszR1lDpjiPoz52O0n1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703444;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eRUX/5S9UOo+rDRG4Qm3COyRot6eWYZZm9uVcRV35C4=;
	b=qxuwwtSqGSlLY8kK5G0h2P9m1UMO/2jTSBc97JCBVsKIsw97+rYGp0SsGeSJoZIgVFa4
	 5sZojw+Py6JygyVgJmIptymhRNn/Mz9ZOnM3v68ffWU7ln0aMHciExSUs0qSzerLKjcZB
	 6IXLJAnFIJDgn/TmcOuaIxG2+NeaJJdaaAQAPFgvOr2Ks5bxGt8uGsv78DUCKUxnMWpLG
	 n/BmbmS+uWxuZtZ6uri5nYnYIjVlkoBs85E4pM342XbYR2FbfoRJN8/PdPRTNN4r/f19c
	 heflAzGrfnLDVAhVaGkpXRefjh57CqHbyg3GUQ8XmMDadyWGOXNNT48wOZtnGci0W4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PNrV4sZV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F3606A6A1;
	Thu, 26 Nov 2026 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PNrV4sZV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285311F000D4;
	Thu, 26 Nov 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795703443;
	bh=eRUX/5S9UOo+rDRG4Qm3COyRot6eWYZZm9uVcRV35C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PNrV4sZVaMwPiTWaAPN/jV1TEtbkNWx8sp9FnI97H0TV3XVekfpapC7GpMVueyiXq
	 Dy0kpa+BBXVKWxbesxMsNvJfNyry3kOTqd/AB7W6BL7hygjs+qfnQ2U6ZccWEbEUsD
	 v1Hnt54QynemBHHscnUCj+9iV8egANrb+vTGyUjLCWK9/b9qkW3EahL3rdV4L9NX/Y
	 +J+byAfpQbrN1XX7vy7+6B8W6ofeOAjy61q8QzrZldwrtmfAR1tz0IKUH28THKbHi3
	 3myyitBB906eFIiUjDez8HSr1SaeoDjs7xOmid5xhmrSmnIxdJCsv6JzU56s4yQFXl
	 PKoBIyyOM6Hsg==
Date: Thu, 26 Nov 2026 14:30:38 +0000
From: Simon Horman <horms@kernel.org>
To: Haoli Zhang <26031212468@stu.xidian.edu.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com,
	25031212117@stu.xidian.edu.cn, byu@xidian.edu.cn
Subject: Re: [PATCH net v2] ppp: serialize channel operations with unregister
Message-ID: <20261126143038.GB31322@horms.kernel.org>
References: <20261119084333.371234-1-26031212468@stu.xidian.edu.cn>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119084333.371234-1-26031212468@stu.xidian.edu.cn>

On Thu, Nov 19, 2026 at 04:43:33PM +0800, Haoli Zhang wrote:
> The channel unregister path disconnects a channel before clearing
> pch->chan. A concurrent PPPIOCCONNECT can observe pch->ppp as NULL while
> pch->chan is still valid and attach the channel again. Unregister can
> then clear pch->chan and release the channel while its clist remains
> linked to a PPP unit.
> 
> Serialize PPPIOCCONNECT with unregister using chan_sem. Hold the mutex
> from before disconnecting the channel until it has been removed from the
> channel list and marked dead. An in-flight connect completes before
> unregister disconnects the channel; later connects see the cleared
> channel and fail.
> 
> PPPIOCDISCONN must use the same mutex. An in-progress PPPIOCDISCONN can
> clear pch->ppp before it has removed pch->clist and completed
> synchronize_net(). Without the mutex, unregister can see pch->ppp as NULL
> and proceed before that disconnect has finished unlinking the channel and
> waiting for network readers. Taking chan_sem in both paths makes
> unregister wait for the disconnect to finish before clearing pch->chan.
> 
> Bridge establishment must also be serialized with unregistering either
> endpoint. Hold both channels' chan_sem mutexes in a stable order while
> establishing the bridge, and reject channels that have been marked dead.
> Unregister holds its channel mutex through unbridging and marking the
> channel dead, so bridge establishment cannot pass the teardown step and
> leave a new bridge reference behind.
> 
> The transmit fast path is unchanged. chan_sem drains channel ioctl
> callbacks. ppp_disconnect_channel() removes the channel from the PPP unit
> and waits for network readers before unregister clears pch->chan.
> 
> Fixes: 6a196e83a1a7 ("ppp: disconnect channel before nullifying pch->chan")
> Reported-by: syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=6b18da3ef22e33061add
> Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
> ---
> Changes in v2:
> - Serialize PPPIOCDISCONN with channel unregister.
> - Serialize bridge establishment with unregistering either endpoint.
> - Clarify the chan_sem comment and bridge lock ordering.

Reviewed-by: Simon Horman <horms@kernel.org>

