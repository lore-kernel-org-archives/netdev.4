Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050682;
	b=yj+W2X755N1xoI12n5uroFRb4dAgvkPE1uhJGkqRDIRoJLBLIsZeWAqC/cv9SJUjcIvB
	 odWmoDApkd7tHJM8E9QjtU0sDWqV2uovvQ6TIOAIpKvcKsbCSps8OvyRYFiZ85Kx3G67g
	 CVwwqXDK00V1xHmFi5tnrwn9cRs/XeizNdmHeAOuGUFR6wfRqjWOE5oHCnKpPzynIiRlL
	 4/9BJqMAG4Yc6E824TQ3wpAHodb6rYFhXv19LqGU5toTOGC6vvWDiAY/dstnlcfwP6NBt
	 iLgmTa+zdWhUkmCXVQSLJBFpLCvnWeJeLgSqm5kTSgfivJs5aqtcy9yG+lj7dXVsewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050682;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qfTi+55bweZ3lujHuhvCsOW+eaoFg11xdlPDAlgz0IU=;
	b=vF8Ny5Y7ukshAsZeY4YAcc/ez7uXTnPEjJhjcOD5rAu7lBFUfo9rSeO5+UFPaaQsjLdI
	 lAbm/1yjjuxn5hce/XjV34FCEtdiGX4zspMK9drgYL6C48RjJYXAu+Djo7k7Tuyq12f6P
	 1kk8zSchVxmXkPfMCY59axVvV5JIfWM+eTiQ71GWa0UWbUD+LE57wCha+Nu/4KpVuGGyr
	 X+3bTMp5x322hFgL0exliaY0Rt48mwxvlH+ak7JwRrquglCsjF38B3/mVedVST5mv0ACy
	 3hNrSJdguO7f58fj2pO1xz58yzbgjgTagJjc1E9jYymcNGED92EKyWRDxSWz5ooR7iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oB8YztzR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6892606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oB8YztzR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BB51F000C7;
	Thu, 19 Nov 2026 01:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050682;
	bh=qfTi+55bweZ3lujHuhvCsOW+eaoFg11xdlPDAlgz0IU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=oB8YztzRnFiaYfBIZjINZSEOELvM7AHJHIDt/T7NLt9zii59MaKM79HxtiDadVPrv
	 Jvni0d3+3drFOncot93KRQT1X6T/zjOlwEXwoWrVYybdavQVF/fbvfWbZLZzbmxAsM
	 C3acHWKDQxvM488JN/Cm5Y13Eqrv7STADBXfmT8kQzOB+M+E0UAKCJqX4jKULvTKMB
	 MN2DIsMwcZwzfTWAtxth4ajGd9S/27swyhPMOHGQ3N7TZBPmHMy5rPoBlspwcc63Tt
	 gv/KkMCSLUhd+TCmCXxbFbaR/I15/1z4ADb29uuGUPFAf6YBPZDAg1q2Vn2qZ9vUXX
	 DbRLyRsbmryYw==
Date: Wed, 18 Nov 2026 17:11:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Michal Schmidt
 <mschmidt@redhat.com>, edumazet@kernel.org, horms@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
 rdunlap@infradead.org, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 jacob.e.keller@intel.com, jedrzej.jagielski@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, ohartoov@nvidia.com, Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v5 13/15] ice: represent RSS LUTs as devlink
 resources
Message-ID: <20261118171121.447b7e6d@kernel.org>
In-Reply-To: <20261110141534.95614-14-przemyslaw.kitszel@intel.com>
References: <20261110141534.95614-1-przemyslaw.kitszel@intel.com>
	<20261110141534.95614-14-przemyslaw.kitszel@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Nov 2026 15:07:22 +0100 Przemek Kitszel wrote:
> E800 family offers three kinds of RSS LUTs: VSI LUT (sized 64), GLOBAL LUT
> (sized 512), and PF LUT (sized 2048). Until now the GLOBAL kind was not
> used at all. There are two possible usages for it, subsequent commit will
> give VF option to acquire it, and this one enables PF to switch between PF
> LUT and GLOBAL LUT - switching to smaller one is, again, to make it
> possible for VF to then acquire the former one.
>=20
> Devlink resources are used to let user show current usage and change the
> allocation, see examples below.
>=20
> Default state on 8-port card, asking for aggregate "whole device" usage,
> note that there are as many PF LUTs as there is PFs, and, for e810, there
> are 16 GLOBAL LUTs:
> $ devlink resource show devlink_index/11
> devlink_index/11:
>   name rss size 8 unit entry size_min 0 size_max 24 size_gran 1 dpipe_tab=
les none
>     resources:
>       name lut_512 size 0 unit entry size_min 0 size_max 16 size_gran 1 d=
pipe_tables none
>       name lut_2048 size 8 unit entry size_min 0 size_max 8 size_gran 1 d=
pipe_tables none

The LUTs are not sub-dividable right? The 512 LUT tables "always
exist", they are not collapsed up to form the 2048 entry ones?
If so it'd be more intuitive to me to have:

 lut_512 size $hw-count size_max $hw-count occ $currently-used

size 0 size_max 16 would tell me we configured the device to not have
any 512 LUTs but IIUC it does still have them.

Then I'd have expected per-PF/VF resource which tells the driver
max LUT size allowed for the function:

 lut/pf0 size 1024 (<- we let it use 1024 LUT)=20
         size_max 2048 (<- max configurable)
         occ 512 (<- currently only 512 is used)

maybe for you occ =3D=3D size to day, but we tried to lay the foundation
for dynamic RSS table sizing in Netlink. Note that Netlink accepts RSS
tables smaller than the one reported by the device. I intend it to
mean that user wants the table at least that size. IOW if device
declares it's RSS table as 2048 but user send a table of 512 entries
via devlink - the driver should be free to reallocate the table down
to 512 (or a multiple, so 1024, Bjorn has added the "fold / unfold"
helpers already as part of other work).

What am I missing?

> Now let's add GLOBAL LUT for a single PF (on one-port NIC):
> $ sudo devlink resource set pci/0000:18:00.0 path rss/lut_512 size 1
> And show it's resources after that:
> $ devlink resource show pci/0000:18:00.0
> pci/0000:18:00.0:
>   name rss size 2 unit entry size_min 0 size_max 2 size_gran 1 dpipe_tabl=
es none
>     resources:
>       name lut_512 size 1 unit entry size_min 0 size_max 1 size_gran 1 dp=
ipe_tables none
>       name lut_2048 size 1 unit entry size_min 0 size_max 1 size_gran 1 d=
pipe_tables none
> Let's take the PF LUT out of that PF afterwards:
> $ sudo devlink resource set pci/0000:18:00.0 path rss/lut_2048 size 0
> now `ethtool -x $ifacename` will report smaller RSS table.
>=20
> Changing the LUT of a PF resets its RSS indirection table to the default
> spread, as the table size changes, and the ethtool core is told that
> the user table is lost. The PF LUT change is done under rtnl, as
> the ethtool core sizes its RSS buffers by the table size under rtnl.

Why?! =F0=9F=98=B1=EF=B8=8F
The resource change should only control the max table size the driver
can allocate *when it allocates a new one*. Increasing the max allowed
table size certainly mustn't cause loss of config.

> FW drops RSS LUT assignments on reset, so the driver gives the PF its PF
> LUT back after each reset, and logs when that discards a devlink change.
> Changes are rejected with -EBUSY while a reset is in progress.
