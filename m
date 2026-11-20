Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179670;
	b=DBL/sqLuoIMN5ZkgcZ60PRek2E2naAodeLcdMOljpcDU33nVC+wbWENwR4Ku+Fs87vae
	 aNd0Lv6bNvGbWUYk2JIBYnMVmIB/uJholZyRdJf+uAyXuSW/hrd5MG9rpsaaUGzk/Fr8o
	 wiEoRQG6SE2NVPexLYaloB4TNRsAy5UK7yLV+KezWAfIAZKLGv+tURLD3u+5QugddRndn
	 2XZbZvTCdVvRcwXYcB6qyuF8qpochrtyyt1miFLsistAKkGXKurrWUtM5zCpWdFA7Kt7J
	 Xlzicl0EHQ0we8ISbc5MpDE3Z0PjgvmF26Jc3RGbIPteqO5jl46TWTWoQZLzK4/BkAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179670;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GRDyBWMO0iFPzHQxYTxXh7iJWh7mjq8TmKnnHRVSqRk=;
	b=OAyj4cWju8FlFn4e0j4WIs98Rz0YV7mMzZa7nEOBKjnwQyTPvIfsu5UhXDzZi7dPkT4i
	 laTJ90nDtxpEWgsTMy/jIcaW/7Ww2alc65xW0v0o36j8O0KJyM2l/H3jB2/IhPuBsLRaZ
	 O3D5vX+x9WNvyWNwdIRFdc0e+mKG7NnVrJ7GDvwMfPZwi5gGwAE1dcPNq/N2XMtySCezc
	 WtLywCb/ZlLQ5dEVEqcyK7Y2rrwb4dBF3gandid6X4ZMUbUpjA0jQ7jlGy4QLmcYFYN6S
	 yGazaM8NQYms9lJrSKAoTMKVqN4WKQET3V6XFgiqJ0qypqDEKQspwl75mUF4x5CqSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DN0EmNg0;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85242606A320;
	Fri, 20 Nov 2026 13:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85242606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DN0EmNg0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GRDyBWMO0iFPzHQxYTxXh7iJWh7mjq8TmKnnHRVSqRk=; b=DN0EmNg0hi241pGeZIUEwC3chZ
	d9xqtqp4XFdt/lRY88xO//glMrtum3jcnQlHqcMNufLNFIfZd7x5n5ACAgRqgGX/SojAcXki+QOKH
	h08EDwpke6xdotZVeKPfz16RTGLpfVUTFqmWLl1vVJqFh62sDnCOrGfEXRtk563HI3rc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUOEb-000IFT-BI; Fri, 20 Nov 2026 14:00:57 +0100
Date: Fri, 20 Nov 2026 14:00:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Machon <daniel.machon@microchip.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: sunplus: also fix the byte order of
 1c:50:1e MAC addresses
Message-ID: <41c7251f-f201-474a-9a8f-1e366fd64c77@lunn.ch>
References: <20261120073901.21656-1-ag@ffroot.co.za>
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
In-Reply-To: <20261120073901.21656-1-ag@ffroot.co.za>

On Fri, Nov 20, 2026 at 09:39:01AM +0200, Andrew Gaylard wrote:
> The driver reverses a MAC address from the OTP when it finds the
> Sunplus OUI fc:4b:bc at the wrong end. Newer SP7021 chips have
> a different Sunplus OUI (1c:50:1e), possibly stored in the same
> reversed order, which the driver does not recognise. If the reversed
> address has the multicast bit set, the driver rejects it and uses a
> random address; otherwise it uses the reversed address as it is.
> 
> Handle both these OUIs. An address that already starts with either OUI
> is left as is.  On chips that used the reversed address, the interface
> now gets the correct address, so configuration tied to the old address
> (DHCP reservations, udev or networkd rules) will need updating.
> 
> Tested on chips that needed each of these OUIs to be reversed.
> 
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
