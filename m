Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045587;
	b=yqzrRktMoeZgR15doEaWteK74/2Zgkhj6hvhrswOETeTx1vGzNsr2+Y0ISCJfcXUSSoM
	 tOiqNpWjSiyDCXfJIxtzbp/ui+vCYPn6y4/G3NujybzOWl5ziAV39B3O41H80Tuu8EVW7
	 viabDtUsOjSlGVpWq9L0BBHy+h8wcQdhVJtuww5YWA1IegvZjI/izRPeQvtvzOxEngGug
	 9IBWald5HJxS5YA85Ww7RULoua0boh7c3SrEionweM0YA8ODWkvnDMmtbzfuOH+VTji16
	 oekyr1cV/UR1wTwQj95o07R4nE3c9QomsmHg/HkXz6HEzwACdk0SSReCDMYnnzKVbCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045587;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HNja7i0cDkZZcgVhs32yP/2ywh3mIH5zUw9Xu2EFrAM=;
	b=N8hYT3pbiQk72zj9UXwXqoIz+mlReOfOI4vYCz5Ny8SdiWJRbxVUTsaQ+YxsKTuMusL4
	 g34LsA2nDSUXzL7yGiHLi8uTKGSUXqil1DuhgAlm7GnVLJK+J/kzhiUmaLbqQl3P9+m9y
	 gOr27WnNoQvl99FLeXSScxHuLPcDm/XSjXpuK0OQD38VKnaUpoARa/0QyaDVSWX1PBdFa
	 6jZLfwZFvOGOyyqHX3NDy3Uh3YfLl2W6LJryMI4uSdwUmuom5wP4pRjzEJmRui16kl6wS
	 +kLWMtijATLhpEXhp2X/GzuSNUY3WGUs+pwGDxJHldWSe/gAAPWvUK1ZDhpgnsCRJ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ha2LoMUA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E76606A320;
	Wed, 18 Nov 2026 23:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ha2LoMUA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FA31F000C4;
	Wed, 18 Nov 2026 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045587;
	bh=HNja7i0cDkZZcgVhs32yP/2ywh3mIH5zUw9Xu2EFrAM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ha2LoMUAo3uV2mYiApzhtlWggychkU3DQixd+Ds+8yY7YhBZ+WtWgCasaL2LoLnOv
	 VgF79htteYW7z3Y1DBW1XqwolezuW7b7sGpibYIYr0t5apng3tPUO3tViGwghe5G52
	 accSTCnZyLmdRM82OwYQ1Ol5QitE5peRsaiADlpxk4JoKNHZMPE0qW6cRmd8tCKu/A
	 1EpyBLgVhDqVjaIYUys7DRne/Faip3npLfaQl27T40a8wDcV4M4udj5mACORSQ7lVm
	 TRDXiPqfIL9XFuOdzykdtKnqKtoghXUgev4WmhpgWOcWOu+1MYkjyeC3qqU0os1Kz/
	 7t/GSWtTC82Ew==
Date: Wed, 18 Nov 2026 15:46:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5] net: dsa: motorcomm: Add devlink info and
 resources
Message-ID: <20261118154626.3f95dce3@kernel.org>
In-Reply-To: <20261116121627.1182631-1-mmyangfl@gmail.com>
References: <20261116121627.1182631-1-mmyangfl@gmail.com>
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

On Mon, 16 Nov 2026 20:16:20 +0800 David Yang wrote:
> +	for (unsigned int i = 0; i < ARRAY_SIZE(yt921x_devlink_resources);
> +	     i++) {

you could save yourselves the ugly line wrapping by using a signed
type..
