Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132967;
	b=nyLKdb9farNIlX8EOU+hxx/hg0cVpi5LYa3K9AotryeKJ2hs7H73ntxuqeAQL4InoC7c
	 99IqKmhzcQws0ovnqYCKMPfYdOb686bH+at1f+6ox6nvd+s/dwOkDyrNHepeDPeGJKcWn
	 tAb942HHPizkDIWlY9ycSYxe7iIjPR+J8iKWrs7VGhKA9+WEY+9PcI3xsxMcwpP2G2QFs
	 V2M2dj6H9OX00/H7Fpg1nAhiHt00ahexKaLPmkIVAVrNQdVdsDiA53JRiunnyJ11+xI9w
	 37SZa5PnQLt3x6PaA+wVdbfzOdJP9m/HNLrFDmxAC6AF/XO7fIpo0pNttXUPqAJucpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132967;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q3ng9t1y9cFRup1Ns+3CDRm5+FSvNDtvWVP+o+WtIOg=;
	b=dboW8ahNZ7SPuIWO7/c4FiqLdXbIsal7pZ78qvQBJQpb5gxNxfJTC4rzLSSaMsXGzJ3E
	 2ARWCQSuml9bZxyw/NP2vjNJH6mYnXSMQN4f1A2hBdgGMiRhs2YqHYW0b1RTst7DuuWjg
	 go3M/1MKuDSjqdMBeVEiuGTzMdGh8jsy4Shk0uDVAq4FO9Zr0bxl5FdElUuX6JDeqJSPq
	 Xe6xoi9kReIDYAWMDTF84Tnk+47Dh7l7bXaAYkO0UNxL04RQoxUk2IWvaXTx9H/yIQ4Ws
	 j2a93e3/isMARucu70psTK484JQETUt51Iq7+O4fTN4s7vu+N+LP30Ny+bN/Xza87Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfw34QGb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0338606A33A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfw34QGb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAF01F000D0;
	Fri, 20 Nov 2026 00:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132967;
	bh=q3ng9t1y9cFRup1Ns+3CDRm5+FSvNDtvWVP+o+WtIOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gfw34QGb40qyfnWC/vazeUHT9DWZWuH7rKGlFXzRFEa8gquprqnHOJ/VvtP8+vG2P
	 t1vkacVvb/3gHzAaNk+UVtmrOXDx4/Xjxs91OGGjm0dhTfsTCZwnxZ6m6lvEzdVWYG
	 OwUdDoMKf/mVnrhQWkODMl8NmMeH7vSgGJoRzTRv8re03KGI7htqgcvnfDsKuYBYJw
	 rPa8zH+tk67wHcqEb12vrqoUw/+N+WlLHt5unmToj9r7hM0gefkO1DH9ZkTVuNJbCC
	 +damvUa7sNFA6YdBNHDs7ND13UgsCKDPttIT8tzlBCohiPGGzRIDpY6IU80n3bpWuK
	 a737/eDXhP7Gw==
Date: Thu, 19 Nov 2026 16:02:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>, Mohammad Heib
 <mheib@redhat.com>
Cc: <patchwork-bot+netdevbpf@kernel.org>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, <davem@davemloft.net>, <pabeni@redhat.com>,
 <edumazet@kernel.org>, <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>,
 <fballuch@redhat.com>, <aleksandr.loktionov@intel.com>,
 <luoxuanqiang@kylinos.cn>
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-12 (i40e, iavf)
Message-ID: <20261119160246.69144537@kernel.org>
In-Reply-To: <8f362b3d-4b54-4337-af61-b7310d353507@intel.com>
References: <20261113004602.129864-1-anthony.l.nguyen@intel.com>
	<179505360728.2713881.10859053822875993430.git-patchwork-notify@kernel.org>
	<av7qBdVhmyhFKdai@mheib-thinkpadp16vgen1.rmtil.csb>
	<a9639f30-7465-4241-841f-a22b1af54356@intel.com>
	<8f362b3d-4b54-4337-af61-b7310d353507@intel.com>
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

On Thu, 19 Nov 2026 11:44:24 -0800 Jacob Keller wrote:
> >> I noticed that the entire series has been applied except for the first patch.
> >> Was it intentionally dropped?  
> > 
> > The patch did have a "high" comment but that one does really just say
> > "shouldn't you also fix this in ice" which to me shouldn't be a knock
> > against fixing i40e..
> 
> Ignore me :D I can't read. The comment was on a different patch than the
> one that didn't get applied.

But fuzzy-matching your reply - you're right, it was the sashiko comment
of course. It seem to have pointed out that there's plenty other places
that don't do what the commit msg describes as "All callers do this".

Mohammad, you are the author, it's your responsibility not Tony's to
answer the Sashiko review.
