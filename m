Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794849420;
	b=TXJZ46eRdhtXi7IHpQJO+tQjkMUECfIK7GShIR+jjeab79mR9X/xeWqW2uKTBDskPeOT
	 tN/wgixW4YQfjiEJ0L5beW7t+w3F+2keENi34PtrFrsp2j6qIIsFb/LaUGbkWqlvN/bSd
	 3FT5mwfR/y3PxFo/RFMHsKqtAGfg/zkA8hu1CJrVpNJmZz+6zXfg7o8idva+5fZA/MAMt
	 ebM8Agolzp1MNt8iihtd5zUpjLT2KH2nr9K9AmukRbQ8RDwG/pzxT6oMnmvmrDXnOT46c
	 Jxv67M5JL/V0/gVqD/yPF7gDIdanR7XTjixxk+DsyBYHzeJhWFQfXpCi/tuJOxVLJ/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
	b=rMkR58sCpNy3jphQj79reT45TOfHXCGc3nuO8pqkK62OmV8n9u6UDTdiNUyKWqixv2bw
	 1e8j16KQowraQ6Krdeh4uPRtEt7mandY0W3oYHC2pcxgEXn0rWZR1UiLWOc94mCncQY8m
	 5QiS7MYYvkz2SNiIq8jQ3bnUwPl2UcBdkmZ4azUelJZCMuRUUW0n3WMwO1CC+yeS6xKRY
	 f4rz8fDYqxZnjmijtbZMeRHn6DEk/Mh5zcrV3vJXFjV6J9EEe5soBx3AGwQ8lPyDCWNrv
	 S0Nov47Qc6tQRJD6Qmf6XKrLTm6TG0ER6X24OqUFm23/wFku2YfNyYVbtrvfGWPUM1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muR038w6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F44606A89D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F44606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muR038w6
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so5914744a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794849418; cv=none;
        d=google.com; s=arc-20260327;
        b=SKvjQqxdFnb6+oATdWMb0ddeRFejhNPqFJ5eiAXI6kgp7bcxgt5Q9GUHRMuoyuBJ5Q
         NMJ40P0UMZvS8xS7uZc5fAk2iBsX2lrCJQXMEmawYcPdoyvymmPOSqld7QgZzN7rdSFi
         bfziW4jaVn8Wn9stJKWsMIuzHPH6r3AZG1TxZX4Vfpoya4cbqA91/npgT9ht34cAprQv
         DWEoL67OuYRarsrLvOPOC1Fb5wQLzeToTOj4ga93LXh6rBuUPFTxtfaEeQUT2jxL2T+g
         CPHq3iGp8vYuCPNuoeNKkEckmc9md2RXbQLgUn0AqFLzpMO7phn5a5DQ4mGArPgNGNlp
         mRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        fh=mass4YQhCyLQ47uSo247PRQxmQ1jANDW9LO9sWqPrYg=;
        b=CbVG1Ghdm+NANhOHp+txfkx0RxI87Rb8VNfTbXWMGjXPpttapwanXloZ27sRgeV3/t
         fmRdhbkI4Jma9SHVJtLXqeSiFs/gvQsO2fccMVdlVQUXnEjJ7yvaoMLdTGBD2r2PuU5+
         hrgLP7qEHfWgeocg6+EkEsUuQj9AMpd+huln8NSrQcJvSRoZvDYo3QFCEF93AnTMkLd3
         9JVHToav8bhSMFsPu/AiuTgC1uqMWwpBInjmnPaYRkAJsdC54z1ciGh4O1+QtiZWPGkK
         PuYP+fK+tdOiu+Kde4qcR9CdKu6SFloDt0vMpl8uSsOMu1bPpirTPPYmSUTfRby8lM4w
         XWuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849418; x=1795454218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        b=muR038w65/upa4T3A8TQUgAZPPu00HSp8IEYxLeziP5g7EOqEdvXR4kRn7l7HqC4oM
         V/H7jmVddckf4li4Y0IfO1NYwf6mTpnVcEibSiDpSUGa4rmH8J48GG/AdleQHZhCXsRY
         RKMQZVymvxJl7k97IWLEoqvjx7NjiZbQg2uAM4mR3pJQKz5WqOab8nzYhREPb/6gAZ9i
         pBA6UOQY1B36uqzP1y0SScadwu/L0Druqoe1fQdOxwb3sdGBUZ1ThrB2CqjVL4+PzHGX
         wt9TbJGmNBshQby+yMN9+pQ2Lz5tWQc68vsAD3w5jK3lYbmvcjKJb74HqwwAi+/L+rlV
         RvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849418; x=1795454218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        b=JMiIUCnRnuPuJpsivMMi0GAzmCI1mjmwEQbUFNpvdjvJCHPNNND9ybxJ5H16L65jlD
         Eq9YWoDG+gP6/CwPSq5+JOcwd0R3MzbpCrh8Kuca8oqom5Q478lwDHavFIvIBhb0QBin
         K9X9t8CdhNneasjTTWm7+Si2vz+MgDQ+Nw+QPxvt37VYIXKuZ92t3vEe2wL2wwTi4/aL
         3F8I31eyXkAey8c6gliLyn64ceApGf3phgT++4jH5a8LatdPgCbwqezUAjTY4h7dTTej
         Zq936GBUHGV4Et01zUqIV0vYbvMtRH43uAqxYAlYEQFoAz2Jq6/LBID1G+8KJ4MYtKyA
         2CGw==
X-Forwarded-Encrypted: i=1; AL+hErGcYIIW/8h0Ko3tolZEwnPeL8R+qassRvIMfb3Og2mnYN5IBaNH0tqaA1vtO56Zf/cgmwbI748=@vger.kernel.org
X-Gm-Message-State: APuU4Z84YbYO6TwvLfSYYTF7NDtKofZCgvSj/ZwDVKD1cvnuFZoYZfk6
	+e0mivDZwUctS1WnPb6FQ6Cr1YhjtgDvto2YPDha6jQyLsOjyhr01qZB9hXc3nn64C/3fFKP5JW
	dXnINyO5Tv4o963Hb5Sp49eABDRdjrWA=
X-Gm-Gg: AYBFou3lL1vtaqM6wW+fYHFs7Ee66c06ZZmdV++kEmkWjo0DNo7dfzPNJdU20Ap5OFL
	Dp7zGEeNd0XvfgFuQ7UfvDvikl1zw4OUfs0gon6vGgraI/WzxVHB6yeGJ2ZeNx/wUmYnXna9Roj
	4eErLIHHMZxh0Pucm5uWWgYbDHe0soFVwWzuitVyESjiwiOn0cFqknm/MgHiy7x5M5FgUVbVJup
	v6fkXkbiX73ma86WRI9xFdV8jKJpbEHkBI2rTFi+C1+DjgH5QrnaJg2Vms4Gdq8xFB6HrMwrB2r
	Yyr9GDQbLKJI9IAUn8y4FjbI7UM1h42Khd/PLCwdCcUJMfoFhAlBADV/IDbspLR5aoSriVwBAGa
	ShzZEFkJ2s2FQSwZZJhKdlEMJ41kwBE57Tg0nbsMUs6cWSmj11S32pG+zPfr25QuWIcfeh02IJ2
	r5YTUfn5Eo6Ywz0yM=
X-Received: by 2002:aa7:c258:0:b0:6b7:d69a:a3d3 with SMTP id
 4fb4d7f45d1cf-6b7d69aa8fbmr5089335a12.39.1794849418257; Mon, 16 Nov 2026
 09:16:58 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-34-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-34-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:16:46 +0100
X-Gm-Features: AclHuK_s2Kpb4OdbgPngYJl9gLHjfhlAmiJMqLtxRnpTDibz-Ni4SZJspSV9laM
Message-ID: <CAOQ4uxjJVgy-skUbbScfz=eAEATf=iMpqRHNshX=eKu3oiwnrA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 34/44] selftests/ovl: test data-only layers on
 pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> Add tests that overlayfs refuses data-only layers on pseudo filesystems:
>
> - sysfs and procfs via the "::" separator in "lowerdir=3D"
> - sysfs and procfs via "datadir+" by path
> - sysfs and procfs via "datadir+" by file descriptor
> - tmpfs as data-only layer
> - sysfs as regular lower layer
>
> The last two must keep mounting.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  .../selftests/filesystems/overlayfs/.gitignore     |   1 +
>  .../selftests/filesystems/overlayfs/Makefile       |   1 +
>  .../filesystems/overlayfs/pseudo_datadir.c         | 131 +++++++++++++++=
++++++
>  3 files changed, 133 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/.gitignore b/t=
ools/testing/selftests/filesystems/overlayfs/.gitignore
> index b343cc430051d..e1410fee2269d 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/.gitignore
> +++ b/tools/testing/selftests/filesystems/overlayfs/.gitignore
> @@ -3,3 +3,4 @@ dev_in_maps
>  set_layers_via_fds
>  idmapped_mounts
>  automount_in_layer
> +pseudo_datadir
> diff --git a/tools/testing/selftests/filesystems/overlayfs/Makefile b/too=
ls/testing/selftests/filesystems/overlayfs/Makefile
> index 382a59bda5e70..ace75f5627e0f 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/Makefile
> +++ b/tools/testing/selftests/filesystems/overlayfs/Makefile
> @@ -10,6 +10,7 @@ TEST_GEN_PROGS :=3D dev_in_maps
>  TEST_GEN_PROGS +=3D set_layers_via_fds
>  TEST_GEN_PROGS +=3D idmapped_mounts
>  TEST_GEN_PROGS +=3D automount_in_layer
> +TEST_GEN_PROGS +=3D pseudo_datadir
>
>  include ../../lib.mk
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir=
.c b/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir.c
> new file mode 100644
> index 0000000000000..3b59fd3e9f5c2
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "kselftest_harness.h"
> +#include "../wrappers.h"
> +
> +static int setup_tmp(void)
> +{
> +       if (unshare(CLONE_NEWNS))
> +               return -errno;
> +       if (sys_mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL))
> +               return -errno;
> +       if (sys_mount("tmpfs", "/tmp", "tmpfs", 0, NULL))
> +               return -errno;
> +       if (mkdir("/tmp/lower", 0755) || mkdir("/tmp/data", 0755) ||
> +           mkdir("/tmp/merged", 0755))
> +               return -errno;
> +       return 0;
> +}
> +
> +/* Mount an overlayfs with the legacy "lowerdir=3D" option. */
> +static int mount_lowerdir(const char *lowerdir)
> +{
> +       char opts[256];
> +
> +       snprintf(opts, sizeof(opts), "lowerdir=3D%s", lowerdir);
> +       if (sys_mount("overlay", "/tmp/merged", "overlay", MS_RDONLY, opt=
s))
> +               return -errno;
> +       if (umount2("/tmp/merged", 0))
> +               return -errno;
> +       return 0;
> +}
> +
> +static int set_layer(int fd_context, const char *key, const char *path,
> +                    bool by_fd)
> +{
> +       int fd, ret =3D 0;
> +
> +       if (!by_fd) {
> +               if (sys_fsconfig(fd_context, FSCONFIG_SET_STRING, key, pa=
th, 0))
> +                       return -errno;
> +               return 0;
> +       }
> +
> +       fd =3D open(path, O_DIRECTORY | O_CLOEXEC);
> +       if (fd < 0)
> +               return -errno;
> +       if (sys_fsconfig(fd_context, FSCONFIG_SET_FD, key, NULL, fd))
> +               ret =3D -errno;
> +       close(fd);
> +       return ret;
> +}
> +
> +/* Create an overlayfs with "lowerdir+" and "datadir+" through fsconfig.=
 */
> +static int fsmount_layers(const char *lower, const char *data, bool by_f=
d)
> +{
> +       int fd_context, fd_mnt, ret;
> +
> +       fd_context =3D sys_fsopen("overlay", FSOPEN_CLOEXEC);
> +       if (fd_context < 0)
> +               return -errno;
> +
> +       ret =3D set_layer(fd_context, "lowerdir+", lower, by_fd);
> +       if (ret)
> +               goto out;
> +       ret =3D set_layer(fd_context, "datadir+", data, by_fd);
> +       if (ret)
> +               goto out;
> +
> +       if (sys_fsconfig(fd_context, FSCONFIG_CMD_CREATE, NULL, NULL, 0))=
 {
> +               ret =3D -errno;
> +               goto out;
> +       }
> +
> +       fd_mnt =3D sys_fsmount(fd_context, FSMOUNT_CLOEXEC, 0);
> +       if (fd_mnt < 0)
> +               ret =3D -errno;
> +       else
> +               close(fd_mnt);
> +out:
> +       close(fd_context);
> +       return ret;
> +}
> +
> +TEST(datadir_sysfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/sys/kernel"), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/sys/kernel", false), -EI=
NVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/sys/kernel", true), -EIN=
VAL);
> +}
> +
> +TEST(datadir_procfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/proc"), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/proc", false), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/proc", true), -EINVAL);
> +}
> +
> +TEST(datadir_tmpfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/tmp/data"), 0);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/tmp/data", false), 0);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/tmp/data", true), 0);
> +}
> +
> +TEST(lowerdir_sysfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/sys/kernel:/tmp/lower"), 0);
> +       EXPECT_EQ(mount_lowerdir("/sys/kernel::/tmp/data"), 0);
> +       EXPECT_EQ(fsmount_layers("/sys/kernel", "/tmp/data", false), 0);
> +       EXPECT_EQ(fsmount_layers("/sys/kernel", "/tmp/data", true), 0);
> +}
> +
> +TEST_HARNESS_MAIN
>
> --
> 2.53.0
>
