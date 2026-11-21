Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286326;
	b=ZesmHkuV8Pk+41OoWPziYgpTavShEf3FgXYv9Yv37Uhimwfjb112qlTlame5Puz03xz/
	 pHW4k6mUuhWL02HLeieQmMtIX93f89242Vsbs4gZRm1H9E36wJLQtJzO7H9mhWkDGCUsU
	 +96dinB7riLwwoOrm9uanlivyzJG890DrB3TPUHx81/SLOoNhVyhJpyQi0BItYtZi5Gmc
	 kwSct57nLzU9zWQBNtpwRCy3GEUVJcU2p1h1p0wa0mCPorIEquCGTQz4lsNyMIil4ULXf
	 tcUtmAgYip4BlU10T4vyHROzBvDw/LyEIfMeEQRs0KXLJfdc688qIKWGsTWEjyMZYNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286326;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qs9z2klfISFaGoszfegj/VTTKVI7SvqUJ25HN6xRWCQ=;
	b=LirggvEtc0wQLXNSWSBO32kdNG1ffNcwTVe/eVobb2Tbe7TFpdT6ADIFt+So+RMWLm04
	 50oVjlFTHle18T+9hGE1JZ46PA3rUgQBURBasUFvDGFY/ht/MObuzqn0TRVowaxZWHOZi
	 D0DHvdb087TgCtiupwPMdiBoCFhUxeQlWe0iKngdaqqb94DBCCPpO0foBeIp8bVyxRwWj
	 fBu8S75yzB4FrZYbADFQw5GPUBBPU0qyIKkMd8rSO6rGMKGr3o1jceVoRrG/AM3E/kWuy
	 DmrBiX7PfJQ8qwZawSCXdACfevyOIasf0Q5YGMFuzmVH/EWVrv7P7N1P7kuN6maRTRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+oXB9YP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39908606A320;
	Sat, 21 Nov 2026 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+oXB9YP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F001F000C6;
	Sat, 21 Nov 2026 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795286325;
	bh=qs9z2klfISFaGoszfegj/VTTKVI7SvqUJ25HN6xRWCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=X+oXB9YPzvFo9VaFlCYld1qdNpJUTMHif1vfKLmIdp/H/cXmU9dNCW7yQNW3d5XDk
	 Exhe2jQhBXUcF4ZXLWYKhsIZwhYR/GhqYuIb0nmbNGlLSOMZ1WxtnirFIejpRH65TF
	 LKmqgM5ZV6c+zybqmiSmUgFrr8TZbHtQVGvYhw7YeMv2hUe8jkCdktlstSl29ws9V8
	 dVSgT1u4Sg9BTHrofyyN+CqwXV9jyi1HJzmXC9OEraTq3Y0ZZXpcSEDhFbAyZxqvyC
	 FIJmN1UmHX16cUMa2MvWvMmO7wqSEhJx//uhT+ukEsbLkt4hP8mSig2xm5oP7ATyBL
	 0ryNa1L7yI3Hg==
Date: Sat, 21 Nov 2026 10:38:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jijie Shao <shaojijie@huawei.com>, Simon Horman <horms@kernel.org>, Runyu
 Xiao <runyu.xiao@seu.edu.cn>, David Yang <mmyangfl@gmail.com>, Herbert
 Valerio Riedel <hvr@gnu.org>, Danny Kukawka <danny.kukawka@bisect.de>,
 Mugunthan V N <mugunthanvnm@ti.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-kernel@vger.kernel.org, Manuel
 Lauss <manuel.lauss@gmail.com>
Subject: Re: [PATCH net v4 00/10] net: au1000: Bug fixes
Message-ID: <20261121103844.2c27eba4@kernel.org>
In-Reply-To: <189e3942-0a1e-49d9-aca6-88eb3aa5e0e3@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
	<179522240067.3294.10288163066827919663@kernel.org>
	<189e3942-0a1e-49d9-aca6-88eb3aa5e0e3@gmail.com>
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

On Fri, 20 Nov 2026 16:54:49 -0800 Florian Fainelli wrote:
> > *IMPORTANT*: If you do repost (for other reasons) - please include
> > the relevant info in the cover letter or commit messages.  
> 
> The issue that was found during testing is that doing an interface 
> open/close/open would hang, every other issue was a result of code 
> inspection hunting for other bugs.

Do you see the bit above in the quoted message that says *IMPORTANT* ?
