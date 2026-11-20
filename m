Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133161;
	b=DjWtL04KFUMIeTXEDaOJDSrn0gKy3XjRVE0se4NLZHc1wO6z8ULf+KDqHBcOv9WaOzBb
	 41raycG2//yVqcN48eiUDjjsC3VZ61Nb7ycFKbRApTuPWtUR5WBH37s65L74zofkEiE7D
	 f1eVJqPBiOCEI60nFCNvk0Qr6T4bW0hldol5FIJizYp/ZMrIPSFM8aCwWvguCLFT1Jp2e
	 nkEHYw5a/qjpT2WwKkvaEucZeKKR3JAqMMxEd4JlXOS2FZ/82+TgEd7mL49EKYrExkEWN
	 t3+0Hj019G3qCiMSMeVbi1j4s6CQmRXbkb32FhtvhXRQwf/1eRw70rwl2B9EzYVIXdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133161;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=azqLA0qAXYUCa45xOPW0Kp2rz+qW3QafvJ3hp75stTg=;
	b=ZfU24cp7YFBrM/l+a0o7vkvZxfR+HUkftUrlsCoNK2PXef2LIwc4MHvbXl8o06ewUoCF
	 pAqvbvOrJcAhD7HEYBNkGKwN+YG1HDBpPXCaD7IJJjyN5B1MIgvdvKCVWTtGbnViYBfdt
	 rvd/eFCRIbkbb4ZVL5Sdds+oQvPfnW4LtyzfE/FFty6tMj5sHDlKrhhi+yb/JVBMPfA1e
	 Jfz34LyRhQXZu25RNqWzht6ciR1kT3OZitqAO8KwHPvMtqBUYx8+kTzUQzj8Gj1G6JOX7
	 d1i4JNKIN435XhgbHGQJl1SpUZScaON79sNBlSUjkyLFEIALQ42gdAXluxxTP0USJzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C/qRcMCX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6AB606A33D;
	Fri, 20 Nov 2026 00:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C/qRcMCX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6478C1F000C4;
	Fri, 20 Nov 2026 00:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133160;
	bh=azqLA0qAXYUCa45xOPW0Kp2rz+qW3QafvJ3hp75stTg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C/qRcMCXJOeIm4PHfsmYQqzKld2ueQeGDruZ2gAssKMuhhzvSGZgumXxfj9qtBut+
	 VLyc33Pqh4lheBm60yLwGRpH1jNz5WHmDPe0R6BC5TnBFAP8URvpOiB+4lS98IPpUJ
	 QyQ0VpoFd7pzKm+P7IAiPx7cXuyNX4d31756lt04ougDpRPU7dSSO7hXH7MykTONzb
	 5n7uban6mELkAJMo0RjcPElhuqVfiyLMSi6r9oSmA88ms2cwLpk6fdSucGd5xCO5C3
	 TSp3S0gE72R6YzzlIpUROktNaYtb987nfavFMmhVhGE1YzHFN+loroKbvnBFy80nHJ
	 GIrJfJvw72h7A==
Date: Thu, 19 Nov 2026 16:05:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Damato <joe@dama.to>
Cc: tariqt@nvidia.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <20261119160559.45b9fc7f@kernel.org>
In-Reply-To: <av+HfZSa40OFtF+M@devvm20253.cco0.facebook.com>
References: <20261117155353.2250540-1-joe@dama.to>
	<179493106742.3291.11434436383058043225@kernel.org>
	<avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
	<20261119143852.3bca9000@kernel.org>
	<av+HfZSa40OFtF+M@devvm20253.cco0.facebook.com>
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

On Thu, 19 Nov 2026 15:34:21 -0800 Joe Damato wrote:
> On Thu, Nov 19, 2026 at 02:38:52PM -0800, Jakub Kicinski wrote:
> > On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:  
> > > The only fix in this series is the deferred doorbell flush (patch 5), but I
> > > need the other code (patches 1-4) for SW USO support I plan to submit next
> > > if this series is applied.  
> > 
> > Not sure if this is what you meant but this may read as if you were
> > sending a fix for net-next for convenience of sending more patches.
> > To be clear - that's not a valid excuse. That said, here, we're talking
> > about a 10 year old error path bug which nobody apparently have been
> > bothered by. We don't have space in net for such things at this point
> > of the cycle, anyway :S  
> 
> I'm probably just being dense and not following what you mean here.
> 
> I was looking at a local branch that implements SW USO in mlx4 and it was
> getting to be quite long with a lot of patches. I thought that breaking it up
> and moving some of the patches into a standalone series would make it easier
> to review.
> 
> I suppose you are saying I should have just kept it as one longer series,
> instead?

No, not at all. 

You said "The only fix in this series is....I plan to submit next if
this series is applied". Which triggers my suspicion that you packed
a fix with -next stuff for expedience / not having to wait for a
net->net-next merge before you send the rest of USO. I don't think
that's what you meant but since I had to ping Tariq anyway I decided
to wag a finger at you. 

IOW I'm commenting purely on packing what can be perceived as a net
fix in a net-next series.
